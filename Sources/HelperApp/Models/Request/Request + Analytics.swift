import Vapor
import ImperialGoogle

public extension Request {
    func fetchAnalyticsAccessToken(host: String) async throws -> String {
        let googleRouter = try GoogleJWTRouter(callback: "\(host)/googleJWT") { (request, authToken) in
            request.eventLoop.future("Google success!!!")
        }

        googleRouter.scope = ["https://www.googleapis.com/auth/analytics.readonly"]

        let accessTokenFuture = try googleRouter.fetchToken(from: self)
        let accessToken = try await accessTokenFuture.get()
        return accessToken
    }

    func fetchAnalyticsViews(propertyID: String, accessToken: String, type: AnalyticsViewType) async throws -> String? {
        let url = "https://analyticsdata.googleapis.com/v1beta/properties/\(propertyID):runReport"

        let response = try await client.post(URI(string: url)) { req in
            try req.content.encode(AnalyticsRequestBody(type: type), as: .json)

            req.headers.contentType = .json
            req.headers.bearerAuthorization = .init(token: accessToken)
        }

        let result = try response.content.decode(AnalyticsResponse.self)
        return result.rows.first?.metricValues.first?.value
    }
}

public enum AnalyticsViewType: Equatable {
    case page
    case screen(path: String)
}

private struct AnalyticsRequestBody: Encodable {
    let dimensions: [Name]
    let metrics: [Name]
    let dateRanges: [DateRange]
    let dimensionFilter: DimensionFilter
    let limit: String

    struct Name: Encodable {
        let name: String
    }

    struct DateRange: Encodable {
        let startDate: String
        let endDate: String
    }

    struct DimensionFilter: Encodable {
        let filter: Filter

        struct Filter: Encodable {
            let fieldName: String
            let stringFilter: StringFilter

            struct StringFilter: Encodable {
                let matchType: String
                let value: String
            }
        }
    }

    init(type: AnalyticsViewType) {
        self.dimensions = [.init(name: type == .page ? "eventName" : "pagePath")]
        self.metrics = [.init(name: type == .page ? "eventCount" : "screenPageViews")]
        self.dateRanges = [.init(startDate: "2023-02-13", endDate: "today")]

        let filterValue: String
        switch type {
        case .page:
            filterValue = "page_view"
        case .screen(let path):
            filterValue = path
        }
        let stringFilter: DimensionFilter.Filter.StringFilter = .init(matchType: "EXACT", value: filterValue)
        let filter: DimensionFilter.Filter = .init(fieldName: type == .page ? "eventName" : "pagePath", stringFilter: stringFilter)
        self.dimensionFilter = .init(filter: filter)

        self.limit = "1"
    }
}

private struct AnalyticsResponse: Decodable {
    let rows: [RowValue]
    struct RowValue: Decodable {
        let metricValues: [Value]

        struct Value: Decodable {
            let value: String
        }
    }
}

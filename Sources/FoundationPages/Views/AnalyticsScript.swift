public struct AnalyticsScript: HTMLHeadContentView {
    public let tag: Tag = .empty
    public var attributes: [Attribute] = []
    
    private let id: String
    
    public init(id: String) {
        self.id = id
    }
    
    public var body: String {
        """
        <!-- Google tag (gtag.js) -->
        <script defer src="https://www.googletagmanager.com/gtag/js?id=G-\(id)"></script>
        <script defer>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
        
          gtag('config', 'G-\(id)');
        </script>
        """
    }
}

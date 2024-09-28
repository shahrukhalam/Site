public enum Typography {
    public enum LineHeight {
        public static let title: Float = 1.2
        public static let heading: Float = 1.3
        public static let subheading: Float = 1.4
        public static let body: Float = 1.5
    }

    public enum Font {
        public enum Size {
            public static let title: Float = 2.5
            public static let heading1: Float = 1.875
            public static let heading2: Float = 1.5
            public static let heading3: Float = 1.25
            public static let subheading: Float = 1.125
            public static let body: Float = 1
            public static let byline: Float = 0.875
        }

        public enum Weight {
            public static let byline: Int = 500
        }
    }

    public enum Margin {
        public static let byline: Float = 0.25
        public static let body: Float = 0.5
        public static let title: Float = 4
        public static let heading1: Float = 2
        public static let heading2: Float = 1.5
        public static let heading3: Float = 1
        public static let subheading: Float = 0.625
    }
}

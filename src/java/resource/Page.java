package resource;

public enum Page {

    INDEX("/index.jsp"),
    HOME("/home.jsp"),
    ERROR("/WEB-INF/error.jsp"),
    CATEGORY_ITEMS("/category_items.jsp"),
    ITEM_DETAILS("/item_details.jsp"),
    CHECKOUT("/checkout.jsp"),
    INVOICE("/invoice.jsp"),
    LOGIN("/login.jsp"),
    LOGOUT("/logout.jsp");
    
    private final String _url;

    Page(String url) {
        _url = url;
    }

    
    public String getUrl(){
        return _url;
    }
    
}

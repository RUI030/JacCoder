"""
    Extracts the domain name from a given URL string.
    """
def extract_domain_name(url: str) -> str {
    if ("://" in url) {
        url = url.split("://")[1];
    }
    if url.startswith("www.") {
        url = url[4:];
    }
    domain = url.split('/')[0];
    return domain.split('.')[0];
}


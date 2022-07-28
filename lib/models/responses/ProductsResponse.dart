class ProductsResponse {
  String? searchTerm;
  String? categoryName;
  int? itemCount;
  String? redirectUrl;
  List<Products>? products;
  List<Facets>? facets;
  Diagnostics? diagnostics;
  SearchPassMeta? searchPassMeta;
  int? queryId;
  List<String>? discoverSearchProductTypes;
  Campaigns? campaigns;

  ProductsResponse(
      {this.searchTerm,
        this.categoryName,
        this.itemCount,
        this.redirectUrl,
        this.products,
        this.facets,
        this.diagnostics,
        this.searchPassMeta,
        this.queryId,
        this.discoverSearchProductTypes,
        this.campaigns});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    searchTerm = json['searchTerm'];
    categoryName = json['categoryName'];
    itemCount = json['itemCount'];
    redirectUrl = json['redirectUrl'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['facets'] != null) {
      facets = <Facets>[];
      json['facets'].forEach((v) {
        facets!.add(new Facets.fromJson(v));
      });
    }
    diagnostics = json['diagnostics'] != null
        ? new Diagnostics.fromJson(json['diagnostics'])
        : null;
    searchPassMeta = json['searchPassMeta'] != null
        ? new SearchPassMeta.fromJson(json['searchPassMeta'])
        : null;
    queryId = json['queryId'];
    discoverSearchProductTypes =
        json['discoverSearchProductTypes'].cast<String>();
    campaigns = json['campaigns'] != null
        ? new Campaigns.fromJson(json['campaigns'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchTerm'] = this.searchTerm;
    data['categoryName'] = this.categoryName;
    data['itemCount'] = this.itemCount;
    data['redirectUrl'] = this.redirectUrl;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.facets != null) {
      data['facets'] = this.facets!.map((v) => v.toJson()).toList();
    }
    if (this.diagnostics != null) {
      data['diagnostics'] = this.diagnostics!.toJson();
    }
    if (this.searchPassMeta != null) {
      data['searchPassMeta'] = this.searchPassMeta!.toJson();
    }
    data['queryId'] = this.queryId;
    data['discoverSearchProductTypes'] = this.discoverSearchProductTypes;
    if (this.campaigns != null) {
      data['campaigns'] = this.campaigns!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  Price? price;
  String? colour;
  int? colourWayId;
  String? brandName;
  bool? hasVariantColours;
  bool? hasMultiplePrices;
  int? groupId = 0;
  int? productCode;
  String? productType;
  String? url;
  String? imageUrl;
  String? videoUrl = "";
  bool? isSellingFast;
  int? sponsoredCampaignId = 0;

  Products(
      {this.id,
        this.name,
        this.price,
        this.colour,
        this.colourWayId,
        this.brandName,
        this.hasVariantColours,
        this.hasMultiplePrices,
        this.groupId,
        this.productCode,
        this.productType,
        this.url,
        this.imageUrl,
        this.videoUrl,
        this.isSellingFast,
        this.sponsoredCampaignId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    colour = json['colour'];
    colourWayId = json['colourWayId'];
    brandName = json['brandName'];
    hasVariantColours = json['hasVariantColours'];
    hasMultiplePrices = json['hasMultiplePrices'];
    groupId = json['groupId'];
    productCode = json['productCode'];
    productType = json['productType'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    isSellingFast = json['isSellingFast'];
    sponsoredCampaignId = json['sponsoredCampaignId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['colour'] = this.colour;
    data['colourWayId'] = this.colourWayId;
    data['brandName'] = this.brandName;
    data['hasVariantColours'] = this.hasVariantColours;
    data['hasMultiplePrices'] = this.hasMultiplePrices;
    data['groupId'] = this.groupId;
    data['productCode'] = this.productCode;
    data['productType'] = this.productType;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['videoUrl'] = this.videoUrl;
    data['isSellingFast'] = this.isSellingFast;
    data['sponsoredCampaignId'] = this.sponsoredCampaignId;
    return data;
  }
}

class Price {
  Current? current;
  Previous? previous;
  Rrp? rrp;
  bool? isMarkedDown;
  bool? isOutletPrice;
  String? currency;

  Price(
      {this.current,
        this.previous,
        this.rrp,
        this.isMarkedDown,
        this.isOutletPrice,
        this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    previous = json['previous'] != null
        ? new Previous.fromJson(json['previous'])
        : null;
    rrp = json['rrp'] != null ? new Rrp.fromJson(json['rrp']) : null;
    isMarkedDown = json['isMarkedDown'];
    isOutletPrice = json['isOutletPrice'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.previous != null) {
      data['previous'] = this.previous!.toJson();
    }
    if (this.rrp != null) {
      data['rrp'] = this.rrp!.toJson();
    }
    data['isMarkedDown'] = this.isMarkedDown;
    data['isOutletPrice'] = this.isOutletPrice;
    data['currency'] = this.currency;
    return data;
  }
}

class Current {
  double? value = 0.0;
  String? text = "";

  Current({this.value, this.text});

  Current.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Previous {
  double? value = 0.0;
  String? text = "";

  Previous({this.value, this.text});

  Previous.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Rrp {
  double? value = 0.0;
  String? text = "";

  Rrp({this.value, this.text});

  Rrp.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}

class Facets {
  String? id;
  String? name;
  List<FacetValues>? facetValues;
  String? displayStyle;
  String? facetType;
  bool? hasSelectedValues;

  Facets(
      {this.id,
        this.name,
        this.facetValues,
        this.displayStyle,
        this.facetType,
        this.hasSelectedValues});

  Facets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['facetValues'] != null) {
      facetValues = <FacetValues>[];
      json['facetValues'].forEach((v) {
        facetValues!.add(new FacetValues.fromJson(v));
      });
    }
    displayStyle = json['displayStyle'];
    facetType = json['facetType'];
    hasSelectedValues = json['hasSelectedValues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.facetValues != null) {
      data['facetValues'] = this.facetValues!.map((v) => v.toJson()).toList();
    }
    data['displayStyle'] = this.displayStyle;
    data['facetType'] = this.facetType;
    data['hasSelectedValues'] = this.hasSelectedValues;
    return data;
  }
}

class FacetValues {
  int? count;
  String? id;
  String? name;
  bool? isSelected;

  FacetValues({this.count, this.id, this.name, this.isSelected});

  FacetValues.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    id = json['id'];
    name = json['name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['id'] = this.id;
    data['name'] = this.name;
    data['isSelected'] = this.isSelected;
    return data;
  }
}

class Diagnostics {
  String? requestId;
  int? processingTime;
  int? queryTime;
  bool? recommendationsEnabled;
  RecommendationsAnalytics? recommendationsAnalytics;

  Diagnostics(
      {this.requestId,
        this.processingTime,
        this.queryTime,
        this.recommendationsEnabled,
        this.recommendationsAnalytics});

  Diagnostics.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    processingTime = json['processingTime'];
    queryTime = json['queryTime'];
    recommendationsEnabled = json['recommendationsEnabled'];
    recommendationsAnalytics = json['recommendationsAnalytics'] != null
        ? new RecommendationsAnalytics.fromJson(
        json['recommendationsAnalytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    data['processingTime'] = this.processingTime;
    data['queryTime'] = this.queryTime;
    data['recommendationsEnabled'] = this.recommendationsEnabled;
    if (this.recommendationsAnalytics != null) {
      data['recommendationsAnalytics'] =
          this.recommendationsAnalytics!.toJson();
    }
    return data;
  }
}

class RecommendationsAnalytics {
  int? personalisationStatus;
  int? numberOfItems;
  int? numberOfRecs;
  String? personalisationType;
  List<String>? items;

  RecommendationsAnalytics(
      {this.personalisationStatus,
        this.numberOfItems,
        this.numberOfRecs,
        this.personalisationType,
        this.items});

  RecommendationsAnalytics.fromJson(Map<String, dynamic> json) {
    personalisationStatus = json['personalisationStatus'];
    numberOfItems = json['numberOfItems'];
    numberOfRecs = json['numberOfRecs'];
    personalisationType = json['personalisationType'];
    items = json['items'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personalisationStatus'] = this.personalisationStatus;
    data['numberOfItems'] = this.numberOfItems;
    data['numberOfRecs'] = this.numberOfRecs;
    data['personalisationType'] = this.personalisationType;
    data['items'] = this.items;
    return data;
  }
}

class SearchPassMeta {
  bool? isPartial;
  bool? isSpellcheck;
  List<String>? searchPass;
  List<String>? alternateSearchTerms;

  SearchPassMeta(
      {this.isPartial,
        this.isSpellcheck,
        this.searchPass,
        this.alternateSearchTerms});

  SearchPassMeta.fromJson(Map<String, dynamic> json) {
    isPartial = json['isPartial'];
    isSpellcheck = json['isSpellcheck'];
    searchPass = json['searchPass'].cast<String>();
    alternateSearchTerms = json['alternateSearchTerms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPartial'] = this.isPartial;
    data['isSpellcheck'] = this.isSpellcheck;
    data['searchPass'] = this.searchPass;
    data['alternateSearchTerms'] = this.alternateSearchTerms;
    return data;
  }
}

class Campaigns {
  List<String>? promoBanners;
  List<String>? imageTiles;
  List<String>? sponsoredProducts;

  Campaigns({this.promoBanners, this.imageTiles, this.sponsoredProducts});

  Campaigns.fromJson(Map<String, dynamic> json) {
    promoBanners = json['promoBanners'].cast<String>();
    imageTiles = json['imageTiles'].cast<String>();
    sponsoredProducts = json['sponsoredProducts'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promoBanners'] = this.promoBanners;
    data['imageTiles'] = this.imageTiles;
    data['sponsoredProducts'] = this.sponsoredProducts;
    return data;
  }
}

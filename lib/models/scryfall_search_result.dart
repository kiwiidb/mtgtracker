class ScryFallSearchResult {
  List<Data>? data;
  bool? hasMore;
  String? object;
  int? totalCards;

  ScryFallSearchResult({this.data, this.hasMore, this.object, this.totalCards});

  ScryFallSearchResult.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    object = json['object'];
    totalCards = json['total_cards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['has_more'] = hasMore;
    data['object'] = object;
    data['total_cards'] = totalCards;
    return data;
  }
}

class Data {
  String? artist;
  List<String>? artistIds;
  bool? booster;
  String? borderColor;
  String? cardBackId;
  int? cardmarketId;
  int? cmc;
  String? collectorNumber;
  List<String>? colorIdentity;
  List<String>? colors;
  bool? digital;
  int? edhrecRank;
  List<String>? finishes;
  bool? foil;
  String? frame;
  List<String>? frameEffects;
  bool? fullArt;
  List<String>? games;
  bool? highresImage;
  String? id;
  String? illustrationId;
  String? imageStatus;
  ImageUris? imageUris;
  String? lang;
  String? layout;
  Legalities? legalities;
  String? manaCost;
  List<int>? multiverseIds;
  String? name;
  bool? nonfoil;
  String? object;
  String? oracleId;
  String? oracleText;
  bool? oversized;
  String? power;
  Preview? preview;
  Prices? prices;
  String? printsSearchUri;
  bool? promo;
  PurchaseUris? purchaseUris;
  String? rarity;
  RelatedUris? relatedUris;
  String? releasedAt;
  bool? reprint;
  bool? reserved;
  String? rulingsUri;
  String? scryfallSetUri;
  String? scryfallUri;
  String? securityStamp;
  String? set;
  String? setId;
  String? setName;
  String? setSearchUri;
  String? setType;
  String? setUri;
  bool? storySpotlight;
  int? tcgplayerId;
  bool? textless;
  String? toughness;
  String? typeLine;
  String? uri;
  bool? variation;
  String? watermark;

  Data(
      {this.artist,
      this.artistIds,
      this.booster,
      this.borderColor,
      this.cardBackId,
      this.cardmarketId,
      this.cmc,
      this.collectorNumber,
      this.colorIdentity,
      this.colors,
      this.digital,
      this.edhrecRank,
      this.finishes,
      this.foil,
      this.frame,
      this.frameEffects,
      this.fullArt,
      this.games,
      this.highresImage,
      this.id,
      this.illustrationId,
      this.imageStatus,
      this.imageUris,
      this.lang,
      this.layout,
      this.legalities,
      this.manaCost,
      this.multiverseIds,
      this.name,
      this.nonfoil,
      this.object,
      this.oracleId,
      this.oracleText,
      this.oversized,
      this.power,
      this.preview,
      this.prices,
      this.printsSearchUri,
      this.promo,
      this.purchaseUris,
      this.rarity,
      this.relatedUris,
      this.releasedAt,
      this.reprint,
      this.reserved,
      this.rulingsUri,
      this.scryfallSetUri,
      this.scryfallUri,
      this.securityStamp,
      this.set,
      this.setId,
      this.setName,
      this.setSearchUri,
      this.setType,
      this.setUri,
      this.storySpotlight,
      this.tcgplayerId,
      this.textless,
      this.toughness,
      this.typeLine,
      this.uri,
      this.variation,
      this.watermark});

  Data.fromJson(Map<String, dynamic> json) {
    artist = json['artist'];
    booster = json['booster'];
    borderColor = json['border_color'];
    cardBackId = json['card_back_id'];
    cardmarketId = json['cardmarket_id'];
    collectorNumber = json['collector_number'];
    digital = json['digital'];
    edhrecRank = json['edhrec_rank'];
    foil = json['foil'];
    frame = json['frame'];
    fullArt = json['full_art'];
    highresImage = json['highres_image'];
    id = json['id'];
    illustrationId = json['illustration_id'];
    imageStatus = json['image_status'];
    imageUris = json['image_uris'] != null
        ? ImageUris.fromJson(json['image_uris'])
        : null;
    lang = json['lang'];
    layout = json['layout'];
    legalities = json['legalities'] != null
        ? Legalities.fromJson(json['legalities'])
        : null;
    manaCost = json['mana_cost'];
    multiverseIds = json['multiverse_ids'].cast<int>();
    name = json['name'];
    nonfoil = json['nonfoil'];
    object = json['object'];
    oracleId = json['oracle_id'];
    oracleText = json['oracle_text'];
    oversized = json['oversized'];
    power = json['power'];
    preview =
        json['preview'] != null ? Preview.fromJson(json['preview']) : null;
    prices = json['prices'] != null ? Prices.fromJson(json['prices']) : null;
    printsSearchUri = json['prints_search_uri'];
    promo = json['promo'];
    purchaseUris = json['purchase_uris'] != null
        ? PurchaseUris.fromJson(json['purchase_uris'])
        : null;
    rarity = json['rarity'];
    relatedUris = json['related_uris'] != null
        ? RelatedUris.fromJson(json['related_uris'])
        : null;
    releasedAt = json['released_at'];
    reprint = json['reprint'];
    reserved = json['reserved'];
    rulingsUri = json['rulings_uri'];
    scryfallSetUri = json['scryfall_set_uri'];
    scryfallUri = json['scryfall_uri'];
    securityStamp = json['security_stamp'];
    set = json['set'];
    setId = json['set_id'];
    setName = json['set_name'];
    setSearchUri = json['set_search_uri'];
    setType = json['set_type'];
    setUri = json['set_uri'];
    storySpotlight = json['story_spotlight'];
    tcgplayerId = json['tcgplayer_id'];
    textless = json['textless'];
    toughness = json['toughness'];
    typeLine = json['type_line'];
    uri = json['uri'];
    variation = json['variation'];
    watermark = json['watermark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['artist'] = artist;
    data['artist_ids'] = artistIds;
    data['booster'] = booster;
    data['border_color'] = borderColor;
    data['card_back_id'] = cardBackId;
    data['cardmarket_id'] = cardmarketId;
    data['cmc'] = cmc;
    data['collector_number'] = collectorNumber;
    data['color_identity'] = colorIdentity;
    data['colors'] = colors;
    data['digital'] = digital;
    data['edhrec_rank'] = edhrecRank;
    data['finishes'] = finishes;
    data['foil'] = foil;
    data['frame'] = frame;
    data['frame_effects'] = frameEffects;
    data['full_art'] = fullArt;
    data['games'] = games;
    data['highres_image'] = highresImage;
    data['id'] = id;
    data['illustration_id'] = illustrationId;
    data['image_status'] = imageStatus;
    if (imageUris != null) {
      data['image_uris'] = imageUris!.toJson();
    }
    data['lang'] = lang;
    data['layout'] = layout;
    if (legalities != null) {
      data['legalities'] = legalities!.toJson();
    }
    data['mana_cost'] = manaCost;
    data['multiverse_ids'] = multiverseIds;
    data['name'] = name;
    data['nonfoil'] = nonfoil;
    data['object'] = object;
    data['oracle_id'] = oracleId;
    data['oracle_text'] = oracleText;
    data['oversized'] = oversized;
    data['power'] = power;
    if (preview != null) {
      data['preview'] = preview!.toJson();
    }
    if (prices != null) {
      data['prices'] = prices!.toJson();
    }
    data['prints_search_uri'] = printsSearchUri;
    data['promo'] = promo;
    if (purchaseUris != null) {
      data['purchase_uris'] = purchaseUris!.toJson();
    }
    data['rarity'] = rarity;
    if (relatedUris != null) {
      data['related_uris'] = relatedUris!.toJson();
    }
    data['released_at'] = releasedAt;
    data['reprint'] = reprint;
    data['reserved'] = reserved;
    data['rulings_uri'] = rulingsUri;
    data['scryfall_set_uri'] = scryfallSetUri;
    data['scryfall_uri'] = scryfallUri;
    data['security_stamp'] = securityStamp;
    data['set'] = set;
    data['set_id'] = setId;
    data['set_name'] = setName;
    data['set_search_uri'] = setSearchUri;
    data['set_type'] = setType;
    data['set_uri'] = setUri;
    data['story_spotlight'] = storySpotlight;
    data['tcgplayer_id'] = tcgplayerId;
    data['textless'] = textless;
    data['toughness'] = toughness;
    data['type_line'] = typeLine;
    data['uri'] = uri;
    data['variation'] = variation;
    data['watermark'] = watermark;
    return data;
  }
}

class ImageUris {
  String? artCrop;
  String? borderCrop;
  String? large;
  String? normal;
  String? png;
  String? small;

  ImageUris(
      {this.artCrop,
      this.borderCrop,
      this.large,
      this.normal,
      this.png,
      this.small});

  ImageUris.fromJson(Map<String, dynamic> json) {
    artCrop = json['art_crop'];
    borderCrop = json['border_crop'];
    large = json['large'];
    normal = json['normal'];
    png = json['png'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['art_crop'] = artCrop;
    data['border_crop'] = borderCrop;
    data['large'] = large;
    data['normal'] = normal;
    data['png'] = png;
    data['small'] = small;
    return data;
  }
}

class Legalities {
  String? alchemy;
  String? brawl;
  String? commander;
  String? duel;
  String? explorer;
  String? future;
  String? gladiator;
  String? historic;
  String? legacy;
  String? modern;
  String? oathbreaker;
  String? oldschool;
  String? pauper;
  String? paupercommander;
  String? penny;
  String? pioneer;
  String? predh;
  String? premodern;
  String? standard;
  String? standardbrawl;
  String? timeless;
  String? vintage;

  Legalities(
      {this.alchemy,
      this.brawl,
      this.commander,
      this.duel,
      this.explorer,
      this.future,
      this.gladiator,
      this.historic,
      this.legacy,
      this.modern,
      this.oathbreaker,
      this.oldschool,
      this.pauper,
      this.paupercommander,
      this.penny,
      this.pioneer,
      this.predh,
      this.premodern,
      this.standard,
      this.standardbrawl,
      this.timeless,
      this.vintage});

  Legalities.fromJson(Map<String, dynamic> json) {
    alchemy = json['alchemy'];
    brawl = json['brawl'];
    commander = json['commander'];
    duel = json['duel'];
    explorer = json['explorer'];
    future = json['future'];
    gladiator = json['gladiator'];
    historic = json['historic'];
    legacy = json['legacy'];
    modern = json['modern'];
    oathbreaker = json['oathbreaker'];
    oldschool = json['oldschool'];
    pauper = json['pauper'];
    paupercommander = json['paupercommander'];
    penny = json['penny'];
    pioneer = json['pioneer'];
    predh = json['predh'];
    premodern = json['premodern'];
    standard = json['standard'];
    standardbrawl = json['standardbrawl'];
    timeless = json['timeless'];
    vintage = json['vintage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alchemy'] = alchemy;
    data['brawl'] = brawl;
    data['commander'] = commander;
    data['duel'] = duel;
    data['explorer'] = explorer;
    data['future'] = future;
    data['gladiator'] = gladiator;
    data['historic'] = historic;
    data['legacy'] = legacy;
    data['modern'] = modern;
    data['oathbreaker'] = oathbreaker;
    data['oldschool'] = oldschool;
    data['pauper'] = pauper;
    data['paupercommander'] = paupercommander;
    data['penny'] = penny;
    data['pioneer'] = pioneer;
    data['predh'] = predh;
    data['premodern'] = premodern;
    data['standard'] = standard;
    data['standardbrawl'] = standardbrawl;
    data['timeless'] = timeless;
    data['vintage'] = vintage;
    return data;
  }
}

class Preview {
  String? previewedAt;
  String? source;
  String? sourceUri;

  Preview({this.previewedAt, this.source, this.sourceUri});

  Preview.fromJson(Map<String, dynamic> json) {
    previewedAt = json['previewed_at'];
    source = json['source'];
    sourceUri = json['source_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['previewed_at'] = previewedAt;
    data['source'] = source;
    data['source_uri'] = sourceUri;
    return data;
  }
}

class Prices {
  String? eur;
  String? eurFoil;
  String? usd;
  String? usdFoil;

  Prices({this.eur, this.eurFoil, this.usd, this.usdFoil});

  Prices.fromJson(Map<String, dynamic> json) {
    eur = json['eur'];
    eurFoil = json['eur_foil'];
    usd = json['usd'];
    usdFoil = json['usd_foil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eur'] = eur;
    data['eur_foil'] = eurFoil;
    data['usd'] = usd;
    data['usd_foil'] = usdFoil;
    return data;
  }
}

class PurchaseUris {
  String? cardhoarder;
  String? cardmarket;
  String? tcgplayer;

  PurchaseUris({this.cardhoarder, this.cardmarket, this.tcgplayer});

  PurchaseUris.fromJson(Map<String, dynamic> json) {
    cardhoarder = json['cardhoarder'];
    cardmarket = json['cardmarket'];
    tcgplayer = json['tcgplayer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardhoarder'] = cardhoarder;
    data['cardmarket'] = cardmarket;
    data['tcgplayer'] = tcgplayer;
    return data;
  }
}

class RelatedUris {
  String? edhrec;
  String? gatherer;
  String? tcgplayerInfiniteArticles;
  String? tcgplayerInfiniteDecks;

  RelatedUris(
      {this.edhrec,
      this.gatherer,
      this.tcgplayerInfiniteArticles,
      this.tcgplayerInfiniteDecks});

  RelatedUris.fromJson(Map<String, dynamic> json) {
    edhrec = json['edhrec'];
    gatherer = json['gatherer'];
    tcgplayerInfiniteArticles = json['tcgplayer_infinite_articles'];
    tcgplayerInfiniteDecks = json['tcgplayer_infinite_decks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['edhrec'] = edhrec;
    data['gatherer'] = gatherer;
    data['tcgplayer_infinite_articles'] = tcgplayerInfiniteArticles;
    data['tcgplayer_infinite_decks'] = tcgplayerInfiniteDecks;
    return data;
  }
}

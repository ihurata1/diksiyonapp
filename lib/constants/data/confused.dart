var confusedBody = """[
  {
    "yanlis": "indirmek",
    "dogru": "indirgemek",
    "id": 46
  },
  {
    "yanlis": "şura",
    "dogru": "şûra",
    "id": 83
  },
  {
    "yanlis": "temiz",
    "dogru": "temyiz",
    "id": 92
  },
  {
    "yanlis": "haya",
    "dogru": "hayâ",
    "id": 44
  },
  {
    "yanlis": "konsantre",
    "dogru": "konsantrasyon",
    "id": 58
  },
  {
    "yanlis": "nakil",
    "dogru": "nâkil",
    "id": 71
  },
  {
    "yanlis": "eyer",
    "dogru": "eğer",
    "id": 34
  },
  {
    "yanlis": "yönetmenlik",
    "dogru": "yönetmelik",
    "id": 106
  },
  {
    "yanlis": "akit",
    "dogru": "âkit",
    "id": 8
  },
  {
    "yanlis": "folklor",
    "dogru": "halk oyunları",
    "id": 36
  },
  {
    "yanlis": "yaşantı",
    "dogru": "hayat",
    "id": 104
  },
  {
    "yanlis": "tahrifat",
    "dogru": "tahribat",
    "id": 85
  },
  {
    "yanlis": "mahsur",
    "dogru": "mahzur",
    "id": 61
  },
  {
    "yanlis": "gerçekleşen",
    "dogru": "meydana gelen",
    "id": 38
  },
  {
    "yanlis": "dahi",
    "dogru": "dâhi ",
    "id": 26
  },
  {
    "yanlis": "uhde",
    "dogru": "ukde",
    "id": 94
  },
  {
    "yanlis": "cefakâr",
    "dogru": "cefakeş",
    "id": 24
  },
  {
    "yanlis": "takdir",
    "dogru": "taktir",
    "id": 86
  },
  {
    "yanlis": "hakimane",
    "dogru": "hâkimane",
    "id": 41
  },
  {
    "yanlis": "etkin",
    "dogru": "etken",
    "id": 33
  },
  {
    "yanlis": "depremin şiddeti",
    "dogru": "depremin büyüklüğü",
    "id": 29
  },
  {
    "yanlis": "adem",
    "dogru": "âdem",
    "id": 3
  },
  {
    "yanlis": "kamelya",
    "dogru": "kameriye",
    "id": 51
  },
  {
    "yanlis": "isal",
    "dogru": "ishal",
    "id": 48
  },
  {
    "yanlis": "yar",
    "dogru": "yâr",
    "id": 103
  },
  {
    "yanlis": "aşık",
    "dogru": "âşık",
    "id": 16
  },
  {
    "yanlis": "muhasebe",
    "dogru": "musahabe",
    "id": 67
  },
  {
    "yanlis": "amin",
    "dogru": "âmin",
    "id": 14
  },
  {
    "yanlis": "araz",
    "dogru": "âraz",
    "id": 15
  },
  {
    "yanlis": "ad",
    "dogru": "ad, -ddi",
    "id": 2
  },
  {
    "yanlis": "kaplı",
    "dogru": "çevrili",
    "id": 54
  },
  {
    "yanlis": "ala",
    "dogru": "âlâ",
    "id": 9
  },
  {
    "yanlis": "ayan",
    "dogru": "âyan",
    "id": 17
  },
  {
    "yanlis": "mürteci",
    "dogru": "mülteci",
    "id": 68
  },
  {
    "yanlis": "varis",
    "dogru": "vâris ",
    "id": 98
  },
  {
    "yanlis": "karşın",
    "dogru": "karşılık",
    "id": 56
  },
  {
    "yanlis": "maiyet",
    "dogru": "mahiyet",
    "id": 62
  },
  {
    "yanlis": "meşruiyet",
    "dogru": "meşrutiyet",
    "id": 64
  },
  {
    "yanlis": "ahize",
    "dogru": "avize",
    "id": 7
  },
  {
    "yanlis": "tellak",
    "dogru": "natır",
    "id": 90
  },
  {
    "yanlis": "batın",
    "dogru": "bâtın",
    "id": 20
  },
  {
    "yanlis": "mütevazi",
    "dogru": "mütevazı",
    "id": 70
  },
  {
    "yanlis": "kam",
    "dogru": "kâm",
    "id": 50
  },
  {
    "yanlis": "hak",
    "dogru": "hâk",
    "id": 39
  },
  {
    "yanlis": "ücret",
    "dogru": "para",
    "id": 95
  },
  {
    "yanlis": "ilgili",
    "dogru": "ilişkin",
    "id": 45
  },
  {
    "yanlis": "öğretim",
    "dogru": "öğrenim",
    "id": 77
  },
  {
    "yanlis": "teamül",
    "dogru": "temayül",
    "id": 88
  },
  {
    "yanlis": "tellal",
    "dogru": "tellak",
    "id": 91
  },
  {
    "yanlis": "ayrım",
    "dogru": "ayrılık",
    "id": 18
  },
  {
    "yanlis": "katil",
    "dogru": "ka:til",
    "id": 57
  },
  {
    "yanlis": "hala",
    "dogru": "hâlâ",
    "id": 43
  },
  {
    "yanlis": "irtica",
    "dogru": "iltica",
    "id": 47
  },
  {
    "yanlis": "bağlı",
    "dogru": "bağımlı",
    "id": 19
  },
  {
    "yanlis": "sıcaklık",
    "dogru": "ısı",
    "id": 82
  },
  {
    "yanlis": "kurgu",
    "dogru": "kurmaca",
    "id": 59
  },
  {
    "yanlis": "kanun",
    "dogru": "kânun",
    "id": 52
  },
  {
    "yanlis": "vakıa",
    "dogru": "vâkıâ",
    "id": 96
  },
  {
    "yanlis": "tefriş etmek",
    "dogru": "teşrif etmek",
    "id": 89
  },
  {
    "yanlis": "aciz",
    "dogru": "âciz",
    "id": 1
  },
  {
    "yanlis": "ama",
    "dogru": "âmâ",
    "id": 13
  },
  {
    "yanlis": "geçtiğimiz hafta",
    "dogru": "geçen hafta",
    "id": 37
  },
  {
    "yanlis": "emir",
    "dogru": "emîr",
    "id": 32
  },
  {
    "yanlis": "ademiyet",
    "dogru": "âdemiyet",
    "id": 4
  },
  {
    "yanlis": "mani",
    "dogru": "mâni",
    "id": 63
  },
  {
    "yanlis": "suni",
    "dogru": "sünni",
    "id": 107
  },
  {
    "yanlis": "oldukça",
    "dogru": "çok, çok fazla",
    "id": 76
  },
  {
    "yanlis": "kabil",
    "dogru": "kabîl",
    "id": 49
  },
  {
    "yanlis": "tavsiye",
    "dogru": "tasfiye",
    "id": 87
  },
  {
    "yanlis": "adet",
    "dogru": "âdet",
    "id": 5
  },
  {
    "yanlis": "adına",
    "dogru": "için",
    "id": 6
  },
  {
    "yanlis": "alaka",
    "dogru": "ilişki",
    "id": 10
  },
  {
    "yanlis": "hal",
    "dogru": "hâl",
    "id": 42
  },
  {
    "yanlis": "berat",
    "dogru": "beraat",
    "id": 22
  },
  {
    "yanlis": "nefis",
    "dogru": "nefîs",
    "id": 73
  },
  {
    "yanlis": "kar",
    "dogru": "kâr",
    "id": 55
  },
  {
    "yanlis": "lam",
    "dogru": "lâm",
    "id": 60
  },
  {
    "yanlis": "yad",
    "dogru": "yâd",
    "id": 100
  },
  {
    "yanlis": "seri",
    "dogru": "seri:",
    "id": 81
  },
  {
    "yanlis": "bilakis",
    "dogru": "bilhassa",
    "id": 23
  },
  {
    "yanlis": "masuniyet",
    "dogru": "masumiyet ",
    "id": 108
  },
  {
    "yanlis": "tabii",
    "dogru": "tabi",
    "id": 84
  },
  {
    "yanlis": "vakıf",
    "dogru": "vâkıf ",
    "id": 97
  },
  {
    "yanlis": "nüfus",
    "dogru": "nüfuz",
    "id": 74
  },
  {
    "yanlis": "mütehassis",
    "dogru": "mütehassıs",
    "id": 69
  },
  {
    "yanlis": "alim",
    "dogru": "âlim",
    "id": 12
  },
  {
    "yanlis": "metin",
    "dogru": "metîn",
    "id": 65
  },
  {
    "yanlis": "yoksul",
    "dogru": "yoksun",
    "id": 105
  },
  {
    "yanlis": "fani",
    "dogru": "fâni",
    "id": 35
  },
  {
    "yanlis": "bekar",
    "dogru": "bekâr",
    "id": 21
  },
  {
    "yanlis": "delalet",
    "dogru": "dalalet",
    "id": 28
  },
  {
    "yanlis": "deyim",
    "dogru": "deyiş",
    "id": 30
  },
  {
    "yanlis": "kap",
    "dogru": "kâp",
    "id": 53
  },
  {
    "yanlis": "doyumsuz",
    "dogru": "doyulmayan",
    "id": 31
  },
  {
    "yanlis": "çekimser",
    "dogru": "çekingen",
    "id": 25
  },
  {
    "yanlis": "sadır",
    "dogru": "sâdır",
    "id": 79
  },
  {
    "yanlis": "olasılık",
    "dogru": "olanak",
    "id": 75
  },
  {
    "yanlis": "nazım",
    "dogru": "nâzım",
    "id": 72
  },
  {
    "yanlis": "özel",
    "dogru": "özgü",
    "id": 78
  },
  {
    "yanlis": "teskere",
    "dogru": "tezkere",
    "id": 93
  },
  {
    "yanlis": "sari",
    "dogru": "sâri",
    "id": 80
  },
  {
    "yanlis": "hakim",
    "dogru": "hâkim",
    "id": 40
  },
  {
    "yanlis": "dahil",
    "dogru": "dâhil",
    "id": 27
  },
  {
    "yanlis": "yakınlık",
    "dogru": "uzaklık",
    "id": 102
  },
  {
    "yanlis": "yakın",
    "dogru": "yaklaşık",
    "id": 101
  },
  {
    "yanlis": "alem",
    "dogru": "âlem",
    "id": 11
  },
  {
    "yanlis": "muhabere",
    "dogru": "muharebe",
    "id": 66
  },
  {
    "yanlis": "vasi",
    "dogru": "vâsi",
    "id": 99
  }
]""";

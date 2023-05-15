final exampleJsonRocket = {
  "height": {"meters": 70, "feet": 229.6},
  "diameter": {"meters": 3.7, "feet": 12},
  "mass": {"kg": 549054, "lb": 1207920},
  "first_stage": {
    "thrust_sea_level": {"kN": 7607, "lbf": 1710000},
    "thrust_vacuum": {"kN": 8227, "lbf": 1849500},
    "reusable": true,
    "engines": 9,
    "fuel_amount_tons": 385,
    "burn_time_sec": 162
  },
  "second_stage": {
    "thrust": {"kN": 934, "lbf": 210000},
    "payloads": {
      "composite_fairing": {
        "height": {"meters": 13.1, "feet": 43},
        "diameter": {"meters": 5.2, "feet": 17.1}
      },
      "option_1": "dragon"
    },
    "reusable": false,
    "engines": 1,
    "fuel_amount_tons": 90,
    "burn_time_sec": 397
  },
  "engines": {
    "isp": {"sea_level": 288, "vacuum": 312},
    "thrust_sea_level": {"kN": 845, "lbf": 190000},
    "thrust_vacuum": {"kN": 914, "lbf": 205500},
    "number": 9,
    "type": "merlin",
    "version": "1D+",
    "layout": "octaweb",
    "engine_loss_max": 2,
    "propellant_1": "liquid oxygen",
    "propellant_2": "RP-1 kerosene",
    "thrust_to_weight": 180.1
  },
  "landing_legs": {"number": 4, "material": "carbon fiber"},
  "payload_weights": [
    {"id": "leo", "name": "Low Earth Orbit", "kg": 22800, "lb": 50265},
    {
      "id": "gto",
      "name": "Geosynchronous Transfer Orbit",
      "kg": 8300,
      "lb": 18300
    },
    {"id": "mars", "name": "Mars Orbit", "kg": 4020, "lb": 8860}
  ],
  "flickr_images": [
    "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg",
    "https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg",
    "https://farm1.staticflickr.com/293/32312415025_6841e30bf1_b.jpg",
    "https://farm1.staticflickr.com/623/23660653516_5b6cb301d1_b.jpg",
    "https://farm6.staticflickr.com/5518/31579784413_d853331601_b.jpg",
    "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg"
  ],
  "name": "Falcon 9",
  "type": "rocket",
  "active": true,
  "stages": 2,
  "boosters": 0,
  "cost_per_launch": 50000000,
  "success_rate_pct": 98,
  "first_flight": "2010-06-04",
  "country": "United States",
  "company": "SpaceX",
  "wikipedia": "https://en.wikipedia.org/wiki/Falcon_9",
  "description":
      "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.",
  "id": "5e9d0d95eda69973a809d1ec"
};

final exampleJsonLaunchPad = {
  "images": {
    "large": ["https://i.imgur.com/9oEMXwa.png"]
  },
  "name": "CCSFS SLC 40",
  "full_name": "Cape Canaveral Space Force Station Space Launch Complex 40",
  "locality": "Cape Canaveral",
  "region": "Florida",
  "latitude": 28.5618571,
  "longitude": -80.577366,
  "launch_attempts": 99,
  "launch_successes": 97,
  "rockets": ["5e9d0d95eda69973a809d1ec"],
  "timezone": "America/New_York",
  "launches": [
    "5eb87cddffd86e000604b32f",
    "5eb87cdeffd86e000604b330",
    "5eb87cdfffd86e000604b331",
    "5eb87ce0ffd86e000604b332",
    "5eb87ce1ffd86e000604b333",
    "5eb87ce2ffd86e000604b335",
    "5eb87ce3ffd86e000604b336",
    "5eb87ce4ffd86e000604b337",
    "5eb87ce4ffd86e000604b338",
    "5eb87ce5ffd86e000604b339",
    "5eb87ce6ffd86e000604b33a",
    "5eb87ce7ffd86e000604b33b",
    "5eb87ce8ffd86e000604b33c",
    "5eb87ceaffd86e000604b33d",
    "5eb87ceaffd86e000604b33e",
    "5eb87cecffd86e000604b33f",
    "5eb87cedffd86e000604b340",
    "5eb87ceeffd86e000604b341",
    "5eb87cefffd86e000604b342",
    "5eb87cf2ffd86e000604b344",
    "5eb87cf3ffd86e000604b345",
    "5eb87cf5ffd86e000604b346",
    "5eb87cf6ffd86e000604b347",
    "5eb87cf8ffd86e000604b348",
    "5eb87cf9ffd86e000604b349",
    "5eb87cfaffd86e000604b34a",
    "5eb87cfbffd86e000604b34b",
    "5eb87d0effd86e000604b35c",
    "5eb87d10ffd86e000604b35e",
    "5eb87d11ffd86e000604b35f",
    "5eb87d15ffd86e000604b362",
    "5eb87d16ffd86e000604b364",
    "5eb87d18ffd86e000604b365",
    "5eb87d1bffd86e000604b368",
    "5eb87d1cffd86e000604b369",
    "5eb87d1effd86e000604b36a",
    "5eb87d20ffd86e000604b36c",
    "5eb87d22ffd86e000604b36d",
    "5eb87d26ffd86e000604b371",
    "5eb87d27ffd86e000604b372",
    "5eb87d2affd86e000604b374",
    "5eb87d2effd86e000604b377",
    "5eb87d30ffd86e000604b378",
    "5eb87d36ffd86e000604b37b",
    "5eb87d37ffd86e000604b37c",
    "5eb87d39ffd86e000604b37d",
    "5eb87d39ffd86e000604b37e",
    "5eb87d3bffd86e000604b37f",
    "5eb87d3cffd86e000604b380",
    "5eb87d3fffd86e000604b382",
    "5eb87d41ffd86e000604b383",
    "5eb87d42ffd86e000604b384",
    "5eb87d45ffd86e000604b387",
    "5eb87d46ffd86e000604b389",
    "5eb87d4affd86e000604b38b",
    "5eb87d50ffd86e000604b394",
    "5ed981d91f30554030d45c2a",
    "5eb87d47ffd86e000604b38a",
    "5ef6a2e70059c33cee4a8293",
    "5eb87d4cffd86e000604b38d",
    "5fb95b3f3a88ae63c954603c",
    "5eb87d4bffd86e000604b38c",
    "5eb87d4fffd86e000604b393",
    "5fd386aa7faea57d297c86c1",
    "5ff6554f9257f579ee3a6c5f",
    "600f9a5e8f798e2a4d5f979c",
    "600f9a718f798e2a4d5f979d",
    "60428aafc041c16716f73cd7",
    "60428ac4c041c16716f73cd8",
    "605b4b6aaa5433645e37d03f",
    "6079bd1c9a06446e8c61bf76",
    "6079bd399a06446e8c61bf77",
    "5fe3af6db3467846b3242160",
    "5eb87d4effd86e000604b390",
    "600f9b6d8f798e2a4d5f979f",
    "618faad2563d69573ed8ca9d",
    "6161c94c6db1a92bfba85349",
    "5fe3afc1b3467846b3242164",
    "61bf3e31cd5ab50b0d936345",
    "6161d32d6db1a92bfba85359",
    "61fc01dae0dc5662b76489a7",
    "61fc0243e0dc5662b76489ae",
    "6234908cf051102e1fcedac4",
    "6243ad8baf52800c6e919252",
    "6243ada6af52800c6e919253",
    "62582a6f5988f159024b964b",
    "625828f25988f159024b9643",
    "6243ae24af52800c6e919258",
    "6243ae0aaf52800c6e919257",
    "62a9f08b20413d2695d88711",
    "6243aea5af52800c6e91925c",
    "62a9f0c920413d2695d88712",
    "62a9f0f820413d2695d88714",
    "62a9f12820413d2695d88716",
    "62a9f86420413d2695d88719",
    "62f3b5200f55c50e192a4e6c",
    "62f3b5330f55c50e192a4e6e",
    "63161329ffc78f3b8567070b",
    "63161339ffc78f3b8567070c"
  ],
  "status": "active",
  "details":
      "SpaceX's primary Falcon 9 pad, where all east coast Falcon 9s launched prior to the AMOS-6 anomaly. Previously used alongside SLC-41 to launch Titan rockets for the US Air Force, the pad was heavily damaged by the AMOS-6 anomaly in September 2016. It returned to flight with CRS-13 on December 15, 2017, boasting an upgraded throwback-style Transporter-Erector modeled after that at LC-39A.",
  "id": "5e9e4501f509094ba4566f84"
};

final exampleJsonLaunch = {
  "fairings": {
    "reused": false,
    "recovery_attempt": false,
    "recovered": false,
    "ships": []
  },
  "links": {
    "patch": {
      "small": "https://images2.imgbox.com/2b/65/8Hd65fHz_o.png",
      "large": "https://images2.imgbox.com/3f/c9/ZczpJ97M_o.png"
    },
    "reddit": {
      "campaign": null,
      "launch": "http://www.reddit.com/r/spacex/comments/2x81fc",
      "media": "https://www.reddit.com/r/spacex/comments/2xmumx",
      "recovery": null
    },
    "flickr": {
      "small": [],
      "original": [
        "https://farm9.staticflickr.com/8749/16788442562_ed460c2d9e_o.jpg",
        "https://farm9.staticflickr.com/8586/16510243060_48d6a9b1f6_o.jpg",
        "https://farm9.staticflickr.com/8641/16490359747_c043b8c61a_o.jpg",
        "https://farm9.staticflickr.com/8636/16510241270_ca83157509_o.jpg",
        "https://farm8.staticflickr.com/7618/16601658850_13b826e705_o.jpg",
        "https://farm9.staticflickr.com/8617/16510041628_883af57512_o.jpg"
      ]
    },
    "presskit":
        "http://www.spacex.com/sites/spacex/files/abs-eutelsatfactsheet.pdf",
    "webcast": "https://www.youtube.com/watch?v=mN7lyaCBzT8",
    "youtube_id": "mN7lyaCBzT8",
    "article":
        "https://www.space.com/28702-spacex-rocket-launches-satellites-video.html",
    "wikipedia": "https://en.wikipedia.org/wiki/ABS-3A"
  },
  "static_fire_date_utc": "2015-02-25T19:10:00.000Z",
  "static_fire_date_unix": 1424891400,
  "net": false,
  "window": 0,
  "rocket": "5e9d0d95eda69973a809d1ec",
  "success": true,
  "failures": [],
  "details":
      "The launch was Boeing's first-ever conjoined launch of a lighter-weight dual-commsat stack that was specifically designed to take advantage of the lower-cost SpaceX Falcon 9 launch vehicle. Per satellite, launch costs were less than \$30 million. The ABS satellite reached its final destination ahead of schedule and started operations on September 10.",
  "crew": [],
  "ships": [],
  "capsules": [],
  "payloads": ["5eb0e4bdb6c3bb0006eeb1f8", "5eb0e4bdb6c3bb0006eeb1f9"],
  "launchpad": "5e9e4501f509094ba4566f84",
  "flight_number": 21,
  "name": "ABS-3A / Eutelsat 115W B",
  "date_utc": "2015-03-02T03:50:00.000Z",
  "date_unix": 1425268200,
  "date_local": "2015-03-02T23:50:00-04:00",
  "date_precision": "hour",
  "upcoming": false,
  "cores": [
    {
      "core": "5e9e28a0f35918c0893b2637",
      "flight": 1,
      "gridfins": false,
      "legs": false,
      "reused": false,
      "landing_attempt": false,
      "landing_success": null,
      "landing_type": null,
      "landpad": null
    }
  ],
  "auto_update": true,
  "tbd": false,
  "launch_library_id": null,
  "id": "5eb87ceaffd86e000604b33e"
};

final exampleJsonLaunchList = {
  "docs": [
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/36/a4/J5gJWxuC_o.png",
          "large": "https://images2.imgbox.com/c6/d2/MIC8sIE4_o.png"
        },
        "reddit": {
          "campaign": "https://www.reddit.com/r/spacex/comments/4ksdy3",
          "launch": "https://www.reddit.com/r/spacex/comments/4o5u6r",
          "media": "https://www.reddit.com/r/spacex/comments/4o5j6o",
          "recovery": "https://www.reddit.com/r/spacex/comments/4on75l"
        },
        "flickr": {
          "small": [],
          "original": [
            "https://farm8.staticflickr.com/7088/27661326426_ce3c3f320d_o.jpg",
            "https://farm8.staticflickr.com/7698/27661325446_affb08be24_o.jpg",
            "https://farm8.staticflickr.com/7733/27661322976_073466e80c_o.jpg",
            "https://farm8.staticflickr.com/7218/27661320706_4c16f3b76b_o.jpg",
            "https://farm8.staticflickr.com/7340/27661315686_6dcb2ce6f9_o.jpg",
            "https://farm8.staticflickr.com/7656/27661313956_e1ac9650b9_o.jpg",
            "https://farm8.staticflickr.com/7616/27661312516_640764f8fd_o.jpg",
            "https://farm8.staticflickr.com/7413/27078893234_0142dd80f0_o.jpg",
            "https://farm8.staticflickr.com/7334/27078889924_8819fd55ea_o.jpg"
          ]
        },
        "presskit":
            "https://drive.google.com/open?id=0BwA3a65ef1OvMGpJSlpDNHhjelU",
        "webcast": "https://www.youtube.com/watch?v=gLNmtUEvI5A",
        "youtube_id": "gLNmtUEvI5A",
        "article":
            "https://spaceflightnow.com/2016/06/15/spacex-successfully-fires-satellites-into-orbit-but-loses-booster-on-landing/",
        "wikipedia": "https://en.wikipedia.org/wiki/ABS_(satellite_operator)"
      },
      "static_fire_date_utc": "2016-06-13T15:03:00.000Z",
      "static_fire_date_unix": 1465830180,
      "net": false,
      "window": 2700,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details":
          "One year after pioneering this technique on flight 16, Falcon again launched two Boeing 702SP gridded ion thruster satellites in a dual-stack configuration, with the two customers sharing the rocket and mission costs. First stage landing attempt on drone ship failed on landing due to low thrust on one of the three landing engines.",
      "crew": [],
      "ships": [
        "5ea6ed2e080df4000697c906",
        "5ea6ed2f080df4000697c90b",
        "5ea6ed2f080df4000697c90c",
        "5ea6ed30080df4000697c913"
      ],
      "capsules": [],
      "payloads": ["5eb0e4bfb6c3bb0006eeb203", "5eb0e4bfb6c3bb0006eeb204"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 31,
      "name": "ABS-2A / Eutelsat 117W B",
      "date_utc": "2016-06-15T14:29:00.000Z",
      "date_unix": 1466000940,
      "date_local": "2016-06-15T10:29:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e28a2f359184f403b2641",
          "flight": 1,
          "gridfins": true,
          "legs": true,
          "reused": false,
          "landing_attempt": true,
          "landing_success": false,
          "landing_type": "ASDS",
          "landpad": "5e9e3032383ecb6bb234e7ca"
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cf8ffd86e000604b348"
    },
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/2b/65/8Hd65fHz_o.png",
          "large": "https://images2.imgbox.com/3f/c9/ZczpJ97M_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": "http://www.reddit.com/r/spacex/comments/2x81fc",
          "media": "https://www.reddit.com/r/spacex/comments/2xmumx",
          "recovery": null
        },
        "flickr": {
          "small": [],
          "original": [
            "https://farm9.staticflickr.com/8749/16788442562_ed460c2d9e_o.jpg",
            "https://farm9.staticflickr.com/8586/16510243060_48d6a9b1f6_o.jpg",
            "https://farm9.staticflickr.com/8641/16490359747_c043b8c61a_o.jpg",
            "https://farm9.staticflickr.com/8636/16510241270_ca83157509_o.jpg",
            "https://farm8.staticflickr.com/7618/16601658850_13b826e705_o.jpg",
            "https://farm9.staticflickr.com/8617/16510041628_883af57512_o.jpg"
          ]
        },
        "presskit":
            "http://www.spacex.com/sites/spacex/files/abs-eutelsatfactsheet.pdf",
        "webcast": "https://www.youtube.com/watch?v=mN7lyaCBzT8",
        "youtube_id": "mN7lyaCBzT8",
        "article":
            "https://www.space.com/28702-spacex-rocket-launches-satellites-video.html",
        "wikipedia": "https://en.wikipedia.org/wiki/ABS-3A"
      },
      "static_fire_date_utc": "2015-02-25T19:10:00.000Z",
      "static_fire_date_unix": 1424891400,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details":
          "The launch was Boeing's first-ever conjoined launch of a lighter-weight dual-commsat stack that was specifically designed to take advantage of the lower-cost SpaceX Falcon 9 launch vehicle. Per satellite, launch costs were less than \$30 million. The ABS satellite reached its final destination ahead of schedule and started operations on September 10.",
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4bdb6c3bb0006eeb1f8", "5eb0e4bdb6c3bb0006eeb1f9"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 21,
      "name": "ABS-3A / Eutelsat 115W B",
      "date_utc": "2015-03-02T03:50:00.000Z",
      "date_unix": 1425268200,
      "date_local": "2015-03-02T23:50:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e28a0f35918c0893b2637",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87ceaffd86e000604b33e"
    }
  ],
  "totalDocs": 205,
  "limit": 2,
  "totalPages": 103,
  "page": 1,
  "pagingCounter": 1,
  "hasPrevPage": false,
  "hasNextPage": true,
  "prevPage": null,
  "nextPage": 2
};

final exampleJsonLunchListWithPagination = {
  "docs": [
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/94/f2/NN6Ph45r_o.png",
          "large": "https://images2.imgbox.com/5b/02/QcxHUb5V_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit": null,
        "webcast": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
        "youtube_id": "0a_00nJ_Y88",
        "article":
            "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
        "wikipedia": "https://en.wikipedia.org/wiki/DemoSat"
      },
      "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
      "static_fire_date_unix": 1142553600,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69955f709d1eb",
      "success": false,
      "failures": [
        {"time": 33, "altitude": null, "reason": "merlin engine failure"}
      ],
      "details": "Engine failure at 33 seconds and loss of vehicle",
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4b5b6c3bb0006eeb1e1"],
      "launchpad": "5e9e4502f5090995de566f86",
      "flight_number": 1,
      "name": "FalconSat",
      "date_utc": "2006-03-24T22:30:00.000Z",
      "date_unix": 1143239400,
      "date_local": "2006-03-25T10:30:00+12:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289df35918033d3b2623",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cd9ffd86e000604b32a"
    },
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/f9/4a/ZboXReNb_o.png",
          "large": "https://images2.imgbox.com/80/a2/bkWotCIS_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit": null,
        "webcast": "https://www.youtube.com/watch?v=Lk4zQ2wP-Nc",
        "youtube_id": "Lk4zQ2wP-Nc",
        "article":
            "https://www.space.com/3590-spacex-falcon-1-rocket-fails-reach-orbit.html",
        "wikipedia": "https://en.wikipedia.org/wiki/DemoSat"
      },
      "static_fire_date_utc": null,
      "static_fire_date_unix": null,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69955f709d1eb",
      "success": false,
      "failures": [
        {
          "time": 301,
          "altitude": 289,
          "reason": "harmonic oscillation leading to premature engine shutdown"
        }
      ],
      "details":
          "Successful first stage burn and transition to second stage, maximum altitude 289 km, Premature engine shutdown at T+7 min 30 s, Failed to reach orbit, Failed to recover first stage",
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4b6b6c3bb0006eeb1e2"],
      "launchpad": "5e9e4502f5090995de566f86",
      "flight_number": 2,
      "name": "DemoSat",
      "date_utc": "2007-03-21T01:10:00.000Z",
      "date_unix": 1174439400,
      "date_local": "2007-03-21T13:10:00+12:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef35918416a3b2624",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cdaffd86e000604b32b"
    },
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/6c/cb/na1tzhHs_o.png",
          "large": "https://images2.imgbox.com/4a/80/k1oAkY0k_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit": null,
        "webcast": "https://www.youtube.com/watch?v=v0w9p3U8860",
        "youtube_id": "v0w9p3U8860",
        "article":
            "http://www.spacex.com/news/2013/02/11/falcon-1-flight-3-mission-summary",
        "wikipedia": "https://en.wikipedia.org/wiki/Trailblazer_(satellite)"
      },
      "static_fire_date_utc": null,
      "static_fire_date_unix": null,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69955f709d1eb",
      "success": false,
      "failures": [
        {
          "time": 140,
          "altitude": 35,
          "reason":
              "residual stage-1 thrust led to collision between stage 1 and stage 2"
        }
      ],
      "details":
          "Residual stage 1 thrust led to collision between stage 1 and stage 2",
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4b6b6c3bb0006eeb1e3", "5eb0e4b6b6c3bb0006eeb1e4"],
      "launchpad": "5e9e4502f5090995de566f86",
      "flight_number": 3,
      "name": "Trailblazer",
      "date_utc": "2008-08-03T03:34:00.000Z",
      "date_unix": 1217734440,
      "date_local": "2008-08-03T15:34:00+12:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef3591814873b2625",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cdbffd86e000604b32c"
    },
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/95/39/sRqN7rsv_o.png",
          "large": "https://images2.imgbox.com/a3/99/qswRYzE8_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit": null,
        "webcast": "https://www.youtube.com/watch?v=dLQ2tZEH6G0",
        "youtube_id": "dLQ2tZEH6G0",
        "article": "https://en.wikipedia.org/wiki/Ratsat",
        "wikipedia": "https://en.wikipedia.org/wiki/Ratsat"
      },
      "static_fire_date_utc": "2008-09-20T00:00:00.000Z",
      "static_fire_date_unix": 1221868800,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69955f709d1eb",
      "success": true,
      "failures": [],
      "details":
          "Ratsat was carried to orbit on the first successful orbital launch of any privately funded and developed, liquid-propelled carrier rocket, the SpaceX Falcon 1",
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4b7b6c3bb0006eeb1e5"],
      "launchpad": "5e9e4502f5090995de566f86",
      "flight_number": 4,
      "name": "RatSat",
      "date_utc": "2008-09-28T23:15:00.000Z",
      "date_unix": 1222643700,
      "date_local": "2008-09-28T11:15:00+12:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef3591855dc3b2626",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cdbffd86e000604b32d"
    },
    {
      "fairings": {
        "reused": false,
        "recovery_attempt": false,
        "recovered": false,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/ab/5a/Pequxd5d_o.png",
          "large": "https://images2.imgbox.com/92/e4/7Cf6MLY0_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit":
            "http://www.spacex.com/press/2012/12/19/spacexs-falcon-1-successfully-delivers-razaksat-satellite-orbit",
        "webcast": "https://www.youtube.com/watch?v=yTaIDooc8Og",
        "youtube_id": "yTaIDooc8Og",
        "article": "http://www.spacex.com/news/2013/02/12/falcon-1-flight-5",
        "wikipedia": "https://en.wikipedia.org/wiki/RazakSAT"
      },
      "static_fire_date_utc": null,
      "static_fire_date_unix": null,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69955f709d1eb",
      "success": true,
      "failures": [],
      "details": null,
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4b7b6c3bb0006eeb1e6"],
      "launchpad": "5e9e4502f5090995de566f86",
      "flight_number": 5,
      "name": "RazakSat",
      "date_utc": "2009-07-13T03:35:00.000Z",
      "date_unix": 1247456100,
      "date_local": "2009-07-13T15:35:00+12:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef359184f103b2627",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cdcffd86e000604b32e"
    },
    {
      "fairings": {
        "reused": null,
        "recovery_attempt": null,
        "recovered": null,
        "ships": []
      },
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/73/7f/u7BKqv2C_o.png",
          "large": "https://images2.imgbox.com/66/b4/8KZsjbt4_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit":
            "http://forum.nasaspaceflight.com/index.php?action=dlattach;topic=21869.0;attach=230821",
        "webcast": "https://www.youtube.com/watch?v=nxSxgBKlYws",
        "youtube_id": "nxSxgBKlYws",
        "article": "http://www.spacex.com/news/2013/02/12/falcon-9-flight-1",
        "wikipedia":
            "https://en.wikipedia.org/wiki/Dragon_Spacecraft_Qualification_Unit"
      },
      "static_fire_date_utc": "2010-03-13T00:00:00.000Z",
      "static_fire_date_unix": 1268438400,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details": null,
      "crew": [],
      "ships": [],
      "capsules": [],
      "payloads": ["5eb0e4b7b6c3bb0006eeb1e7"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 6,
      "name": "Falcon 9 Test Flight",
      "date_utc": "2010-06-04T18:45:00.000Z",
      "date_unix": 1275677100,
      "date_local": "2010-06-04T14:45:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef359185f2b3b2628",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cddffd86e000604b32f"
    },
    {
      "fairings": null,
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/fa/dc/FOUDQ0Sn_o.png",
          "large": "https://images2.imgbox.com/04/6e/kniggvWD_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit": "http://www.spacex.com/files/downloads/cots1-20101206.pdf",
        "webcast": "https://www.youtube.com/watch?v=cdLITgWKe_0",
        "youtube_id": "cdLITgWKe_0",
        "article": "https://en.wikipedia.org/wiki/SpaceX_COTS_Demo_Flight_1",
        "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_COTS_Demo_Flight_1"
      },
      "static_fire_date_utc": "2010-12-04T00:00:00.000Z",
      "static_fire_date_unix": 1291420800,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details": null,
      "crew": [],
      "ships": ["5ea6ed2d080df4000697c901"],
      "capsules": ["5e9e2c5bf35918ed873b2664"],
      "payloads": ["5eb0e4b9b6c3bb0006eeb1e8", "5eb0e4b9b6c3bb0006eeb1e9"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 7,
      "name": "COTS 1",
      "date_utc": "2010-12-08T15:43:00.000Z",
      "date_unix": 1291822980,
      "date_local": "2010-12-08T11:43:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef35918187c3b2629",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cdeffd86e000604b330"
    },
    {
      "fairings": null,
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/c5/f4/XfLVgbaO_o.png",
          "large": "https://images2.imgbox.com/94/8d/YnZ1SLsT_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit":
            "https://www.nasa.gov/pdf/649910main_cots2_presskit_051412.pdf",
        "webcast": "https://www.youtube.com/watch?v=tpQzDbAY7yI",
        "youtube_id": "tpQzDbAY7yI",
        "article": "https://en.wikipedia.org/wiki/Dragon_C2%2B",
        "wikipedia": "https://en.wikipedia.org/wiki/Dragon_C2%2B"
      },
      "static_fire_date_utc": "2012-04-30T00:00:00.000Z",
      "static_fire_date_unix": 1335744000,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details":
          "Launch was scrubbed on first attempt, second launch attempt was successful",
      "crew": [],
      "ships": ["5ea6ed2d080df4000697c901"],
      "capsules": ["5e9e2c5bf3591882af3b2665"],
      "payloads": ["5eb0e4bab6c3bb0006eeb1ea"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 8,
      "name": "COTS 2",
      "date_utc": "2012-05-22T07:44:00.000Z",
      "date_unix": 1335944640,
      "date_local": "2012-05-22T03:44:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ef35918f39c3b262a",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87cdfffd86e000604b331"
    },
    {
      "fairings": null,
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/3e/91/hlGiK49a_o.png",
          "large": "https://images2.imgbox.com/fb/42/0V9JgYQS_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch": null,
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit":
            "https://www.nasa.gov/pdf/694166main_SpaceXCRS-1PressKit.pdf",
        "webcast": "https://www.youtube.com/watch?v=-Vk3hiV_zXU",
        "youtube_id": "-Vk3hiV_zXU",
        "article":
            "https://www.nasa.gov/mission_pages/station/main/spacex-crs1-target.html",
        "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-1"
      },
      "static_fire_date_utc": "2012-09-29T00:00:00.000Z",
      "static_fire_date_unix": 1348876800,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details":
          "CRS-1 successful, but the secondary payload was inserted into abnormally low orbit and lost due to Falcon 9 boost stage engine failure, ISS visiting vehicle safety rules, and the primary payload owner's contractual right to decline a second ignition of the second stage under some conditions.",
      "crew": [],
      "ships": ["5ea6ed2d080df4000697c902"],
      "capsules": ["5e9e2c5bf3591835983b2666"],
      "payloads": ["5eb0e4bab6c3bb0006eeb1eb", "5eb0e4bab6c3bb0006eeb1ec"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 9,
      "name": "CRS-1",
      "date_utc": "2012-10-08T00:35:00.000Z",
      "date_unix": 1349656500,
      "date_local": "2012-10-08T20:35:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ff3591821a73b262b",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87ce0ffd86e000604b332"
    },
    {
      "fairings": null,
      "links": {
        "patch": {
          "small": "https://images2.imgbox.com/bd/fe/lXUYKL28_o.png",
          "large": "https://images2.imgbox.com/bc/c5/fHN3m8KV_o.png"
        },
        "reddit": {
          "campaign": null,
          "launch":
              "https://www.reddit.com/r/space/comments/19gm5f/live_coverage_spacex_crs2_launch_to_the_iss/c8nvah4",
          "media": null,
          "recovery": null
        },
        "flickr": {"small": [], "original": []},
        "presskit":
            "https://www.nasa.gov/sites/default/files/files/Orb2_PRESS_KIT.pdf",
        "webcast": "https://www.youtube.com/watch?v=ik0ElKl5kW4",
        "youtube_id": "ik0ElKl5kW4",
        "article": "https://en.wikipedia.org/wiki/SpaceX_CRS-2",
        "wikipedia": "https://en.wikipedia.org/wiki/SpaceX_CRS-2"
      },
      "static_fire_date_utc": "2013-02-25T18:30:00.000Z",
      "static_fire_date_unix": 1361817000,
      "net": false,
      "window": 0,
      "rocket": "5e9d0d95eda69973a809d1ec",
      "success": true,
      "failures": [],
      "details": "Last launch of the original Falcon 9 v1.0 launch vehicle",
      "crew": [],
      "ships": ["5ea6ed2d080df4000697c902"],
      "capsules": ["5e9e2c5bf359189ef23b2667"],
      "payloads": ["5eb0e4bbb6c3bb0006eeb1ed"],
      "launchpad": "5e9e4501f509094ba4566f84",
      "flight_number": 10,
      "name": "CRS-2",
      "date_utc": "2013-03-01T19:10:00.000Z",
      "date_unix": 1362165000,
      "date_local": "2013-03-01T15:10:00-04:00",
      "date_precision": "hour",
      "upcoming": false,
      "cores": [
        {
          "core": "5e9e289ff3591884e03b262c",
          "flight": 1,
          "gridfins": false,
          "legs": false,
          "reused": false,
          "landing_attempt": false,
          "landing_success": null,
          "landing_type": null,
          "landpad": null
        }
      ],
      "auto_update": true,
      "tbd": false,
      "launch_library_id": null,
      "id": "5eb87ce1ffd86e000604b333"
    }
  ],
  "totalDocs": 205,
  "offset": 0,
  "limit": 10,
  "totalPages": 21,
  "page": 1,
  "pagingCounter": 1,
  "hasPrevPage": false,
  "hasNextPage": true,
  "prevPage": null,
  "nextPage": 2
};

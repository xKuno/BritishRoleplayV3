Config = {
    Weapon = 'WEAPON_HK45BRP',
    RemoveWeapon = true, -- if someone has the Weapon but isn't playing paintball, remove it. 
    RequiredPlayers = 4,
    JoinCircle = vector3(5.49, -1103.55, 28.8),
    QueueTime = 0.5, -- how long until the match starts (minutes)
    MatchLength = 8, -- length of the match (minutes)
    DisplayWinner = 10, -- how long to show who won (seconds)
    ForceFirstPerson = true, -- force first person?
    SpawnPoints = {
        vector3(-34.73877, -1127.798, -2.424642),
        vector3(-39.76084, -1128.672, -2.424643),
        vector3(-42.14906, -1128.452, -2.424644),
        vector3(-44.79821, -1131.409, -2.424644),
        vector3(-49.58258, -1132.489, -2.424646),
        vector3(-54.55252, -1131.635, -2.42464),
        vector3(-51.79232, -1131.608, -2.424641),
        vector3(-51.47078, -1126.274, -2.424641),
        vector3(-55.49516, -1125.054, -2.424634),
        vector3(-60.1148, -1124.886, -2.424655),
        vector3(-65.48864, -1124.924, -2.424648),
        vector3(-66.72336, -1131.092, -2.42464),
        vector3(-68.04679, -1135.051, -2.424656),
        vector3(-66.55819, -1135.509, -2.424641),
        vector3(-61.5582, -1137.273, -2.424628),
        vector3(-58.41277, -1142.044, -2.424644),
        vector3(-53.10359, -1142.605, -2.424643),
    },
    WinnerPosition = vector3(-49.64, -1137.48, -1.2),
    WinnerHeading = 19.95,
    WinnerCam = vector3(-51.73, -1134.25, 2.5),
    Price = 1000,
    Clothes = {
        ChangeClothes = false, -- get paintball clothes when playing?
        Outfits = {
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":0,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":0,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":0,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":0,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":1,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":1,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":1,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":1,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":2,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":2,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":2,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":2,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":3,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":3,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":3,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":3,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":4,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":4,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":4,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":4,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":5,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":5,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":5,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":5,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":6,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":6,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":6,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":6,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":7,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":7,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":7,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":7,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":8,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":8,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":8,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":8,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":9,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":9,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":9,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":9,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"shoes_2":10,"face":0,"sun_2":0,"chain_2":0,"beard_3":0,"complexion_2":0,"makeup_2":0,"watches_1":-1,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":110,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":0,"torso_2":10,"blemishes_1":0,"glasses_1":0,"eyebrows_2":0,"helmet_1":125,"torso_1":148,"chest_1":0,"mask_2":0,"chest_3":0,"mask_1":0,"bodyb_1":0,"lipstick_4":0,"decals_1":0,"sex":0,"moles_2":0,"pants_2":10,"skin":5,"chain_1":0,"hair_1":19,"bags_1":0,"arms_2":10,"glasses_2":0,"bags_2":0,"eyebrows_4":0,"beard_4":0,"ears_2":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":47,"bproof_1":0,"eye_color":0,"watches_2":0,"age_2":0,"blush_2":0,"beard_2":0,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"tshirt_2":0,"eyebrows_3":0,"age_1":0,"eyebrows_1":0,"moles_1":0,"makeup_3":0,"pants_1":67,"makeup_4":0,"lipstick_3":0,"helmet_2":19}'),

            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":0,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":0,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":0,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":1,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":1,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":1,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":2,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":2,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":2,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":3,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":3,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":3,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":4,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":4,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":4,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":5,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":5,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":5,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":6,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":6,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":6,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":7,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":7,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":7,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":8,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":8,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":8,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}'),
            json.decode('{"blemishes_2":0,"bproof_2":0,"complexion_1":0,"hair_2":0,"blush_1":0,"chest_3":0,"face":0,"chain_1":0,"arms_2":6,"beard_3":0,"complexion_2":0,"makeup_2":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"bracelets_1":-1,"arms":102,"tshirt_1":15,"ears_1":-1,"bracelets_2":0,"chest_2":0,"sun_1":0,"hair_color_2":0,"beard_1":10,"torso_2":9,"blemishes_1":0,"glasses_1":0,"eyebrows_2":10,"helmet_1":125,"torso_1":147,"chest_1":0,"mask_2":7,"eyebrows_3":0,"shoes_2":9,"watches_2":0,"lipstick_4":0,"mask_1":0,"sex":0,"chain_2":0,"pants_2":9,"decals_1":0,"bags_2":0,"hair_1":0,"bags_1":0,"watches_1":-1,"glasses_2":0,"sun_2":0,"eyebrows_4":0,"skin":5,"bproof_1":0,"lipstick_1":0,"lipstick_2":0,"shoes_1":46,"blush_2":0,"eye_color":0,"moles_1":0,"age_2":0,"moles_2":0,"beard_2":10,"makeup_1":0,"bodyb_2":0,"hair_color_1":0,"ears_2":0,"beard_4":0,"age_1":0,"eyebrows_1":0,"bodyb_1":0,"makeup_3":0,"pants_1":66,"makeup_4":0,"lipstick_3":0,"helmet_2":5}')
        },
    },
    Translations = {
        ['join_paintball'] = '[~g~E~w~] (costs ~g~£%s~w~) Join the paintball queue\n%s',
        ['leave_paintball'] = '[~g~E~w~] Leave the paintball queue\n%s',  
        ['left_paintball'] = 'You ~r~left ~w~the paintball queue since you walked too far away.',
        ['match_in_progress'] = '~r~%s\n~b~%s~w~seconds left.',
        ['gun_removed'] = 'Your paintball gun got deleted since you are not playing paintball.',
        ['match_ends'] = 'Match ends in: ~g~%s ~w~seconds\nYou have: ~g~%s ~w~kill(s)\nYou have died: ~r~%s ~w~time(s)',
        ['seconds_starts'] = ' the match starts in ',
        ['match_progress'] = 'Match in progress.',
        ['in_queue'] = ' in queue\n',
        ['you_killed'] = 'You killed',
        ['you_got_killed'] = 'You got killed by',
        ['killed_by'] = ' got killed by ',
        ['no_money'] = 'You do not have enough money to play paintball!',
        ['won'] = '~g~%s ~w~won with: %s kills & %s deaths\n~g~You ~w~got: %s kills & %s deaths',
        ['you_won'] = '\n~g~You ~w~won with: %s kills & %s deaths'
        
    },
}
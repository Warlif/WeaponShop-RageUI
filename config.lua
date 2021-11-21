Config = {

    Categories = {

        Pistol = {

            {name =  "WEAPON_SNSPISTOL", label = "~o~Pétoire", price = 10000},

            {name = "WEAPON_VINTAGEPISTOL", label = "~o~Pistolet vintage", price = 20000},

            {name =  "WEAPON_PISTOL50", label = "~o~D.50", price = 75000}

        },

    

        Armes = {

    

            {name = "WEAPON_KNIFE", label = "~o~ Couteau de chasse ", price = 2500},

            {name = "WEAPON_FLASHLIGHT", label = "~o~ Lampe Torche", price = 1500}

        },

    

        Outils = {

            {name = "clip", label = "~o~ Chargeur", price = 500}
    

        },

    

        Chasse = {

    

            {name = "WEAPON_MUSKET", label = "~o~ Mousquet", price = 75000}

    

        },



		Peche = {

    

			{name = "fishingrod", label = "~o~ Canne à pêche ", price = 500},

            {name = "fishbait", label = "~o~ Appât à poisson ", price = 500}

        }

    },



    Position = {

        Shops = {

            {pos = vector3(22.02,-1106.82,29.8), pedPos = vector3(22.63, -1105.5, 29.8-0.98), heading = 150.95, pedModel = "ig_hunter"}, --place des cubes
            {pos = vector3(842.32,-1033.8,28.19), pedPos = vector3(842.39,-1035.41,28.19-0.98), heading = 355.63, pedModel = "ig_hunter"}, --derrière LSPD
            {pos = vector3(810.24,-2157.36,29.62), pedPos = vector3(810.19,-2159.26,29.62-0.98), heading = 1.02, pedModel = "ig_hunter"}, --Stand de tir
            {pos = vector3(-662.28,-934.93,21.83), pedPos = vector3(-662.3,-933.3,21.83-0.98), heading = 179.74, pedModel = "ig_hunter"}, --- marina 
            {pos = vector3(252.26,-50.07,69.94), pedPos = vector3(253.87,-50.33,69.94-0.98), heading = 67.68, pedModel = "ig_hunter"},
            {pos = vector3(-1305.89,-394.26,36.7), pedPos = vector3(-1303.94,-394.78,36.7-0.98), heading = 74.72, pedModel = "ig_hunter"},
            {pos = vector3(-1117.73,2698.44,18.55), pedPos = vector3(-1119.09,2700.08,18.55-0.98), heading = 222.48, pedModel = "ig_hunter"},
            {pos = vector3(-330.74,6083.79,31.45), pedPos = vector3(-331.76,6085.06,31.45-0.98), heading = 230.11, pedModel = "ig_hunter"},
            {pos = vector3(1693.41,3760.01,34.71), pedPos = vector3(1691.97,3761.15,34.71-0.98), heading = 224.54, pedModel = "ig_hunter"},
            {pos = vector3(2567.66,294.28,108.73), pedPos = vector3(2567.84,292.42,108.73-0.98), heading = 357.81, pedModel = "ig_hunter"}

            

        }

    }
}
    Config.Zones = {

        GunShop = {
            Legal = true,
            Items = {},
            Locations = {
                vector3(-662.1, -935.3, 20.8), --fait
                vector3(810.2, -2157.3, 28.6), --fait
                vector3(1693.4, 3759.5, 33.7),
                vector3(-330.2, 6083.8, 30.4),
                vector3(252.3, -50.0, 68.9), --fait
                vector3(22.0, -1107.2, 28.8), --fait
                vector3(2567.6, 294.3, 107.7), 
                vector3(-1117.5, 2698.6, 17.5), --fait
                vector3(-1305.89,-394.26,36.7), --fait
                vector3(842.4, -1033.4, 27.1) --fait
            }
        }
}




Config = {}

Config.OpenKeyMenu = 0x26E9DC00

Config.Language = {
    ['menuHorsesTitle'] = "Shop Horses",
    ['menuComplementsTitle'] = "Accessories",
    ['menuComplementsSubTitle'] = "Mount Accessories",
    ['subMenuComplementsHorsesTitle'] = "Horses",
    ['subMenuComplementsHorsesSubTitle'] = "Horse Accessories",
    ['menuMountsTitle'] = "Mounts",
    ['menuMountsSubTitle'] = "Your Mounts",
    ['menuMountsHorsesTitle'] = "Horses",
    ['menuMountsHorsesSubTitle'] = "Your horse options",
    ['optionSelectYourHorseAccessories'] = "Select Your Horse Accesories",
    ['optionSelectYourHorse'] = "Select Your Horse",
    ['optionSendHorseToStableDesc'] = "Flee your Horse",
    ['optionSendHorseToStable'] = "Flee Horse",
    ['optionTameHorseDesc'] = "Tame a wild horse",
    ['optionTameHorse'] = "Tame Horse",
    ['optionDeleteHorseDesc'] = "Release your horse",
    ['optionDeleteHorse'] = "Release Horse",
    ['putAccessoriesOnHorse'] = "Put a ",
    ['notifNeedBeMount'] = "You need to be mount on a wild horse",
    ['notifHasOwner'] = "This horse has owner",
    ['callHorseName'] = "Call ",
    ['SubTitleOptionsText'] = "Options",
}

Config.Menu = {
    {
       ['Text'] = "Saddle",
       ['SubText'] = "",
       ['Desc'] = "Saddle for horses",
       ['Param'] = {
           ['Tipo'] = 1
       }
   },
    {
       ['Text'] = "Blanket",
       ['SubText'] = "",
       ['Desc'] = "Blanket for horses",
       ['Param'] = {
           ['Tipo'] = 2
       }
   },
    {
       ['Text'] = "Mane",
       ['SubText'] = "",
       ['Desc'] = "Mane for horses",
       ['Param'] = {
           ['Tipo'] = 3
       }
   },
    {
       ['Text'] = "Tail",
       ['SubText'] = "",
       ['Desc'] = "Tail for horses",
       ['Param'] = {
           ['Tipo'] = 4
       }
   },
    {
       ['Text'] = "Bag",
       ['SubText'] = "",
       ['Desc'] = "Bag for horses",
       ['Param'] = {
           ['Tipo'] = 5
       }
   },
    {
       ['Text'] = "Bedroll",
       ['SubText'] = "",
       ['Desc'] = "Bedroll for horses",
       ['Param'] = {
           ['Tipo'] = 6
       }
   },
    {
       ['Text'] = "Stirups",
       ['SubText'] = "",
       ['Desc'] = "Stirups for horses",
       ['Param'] = {
           ['Tipo'] = 7
       }
   }
}


--Horses buy Menu from mrlupo
Config.Horses = {
	{
		['Text'] = "$20 - Tennesseewalker Chestnut",
		['SubText'] = "",
		['Desc'] = "Level Require : ~pa~0",
		['Param'] = {
			['Price'] = 20,
			['Model'] = GetHashKey("A_C_HORSE_TENNESSEEWALKER_CHESTNUT"),
			['Level'] = 0
		}
	},
	{
		['Text'] = "$35 - SHIRE RAVENBLACK",
		['SubText'] = "",
		['Desc'] = "Level Require : ~pa~3",
		['Param'] = {
			['Price'] = 35,
			['Model'] = GetHashKey("A_C_HORSE_SHIRE_RAVENBLACK"),
			['Level'] = 0
		}
	},
	{
		['Text'] = "$45 - APPALOOSA LEOPARD",
		['SubText'] = "",
		['Desc'] = "Level Require : ~pa~6",
		['Param'] = {
			['Price'] = 35,
			['Model'] = GetHashKey("A_C_HORSE_APPALOOSA_LEOPARD"),
			['Level'] = 6
		}
	},
	{
		['Text'] = "$60 - Mr Bill W",
		['SubText'] = "",
		['Desc'] = "Level Require : ~pa~9",
		['Param'] = {
			['Price'] = 60,
			['Model'] = GetHashKey("A_C_HORSE_GANG_BILL"),
			['Level'] = 9
		}
	},
	{
		['Text'] = "$70 - Kentuckysaddle Black",
		['SubText'] = "",
		['Desc'] = "Level Require : ~pa~13",
		['Param'] = {
			['Price'] = 70,
			['Model'] = GetHashKey("A_C_HORSE_KENTUCKYSADDLE_BLACK"),
			['Level'] = 13
		},
	},
	{
		['Text'] = "$150 - THOROUGHBRED BRINDLE",
		['SubText'] = "",
		['Desc'] = "Level Require : ~pa~16",
		['Param'] = {
			['Price'] = 150,
			['Model'] = GetHashKey("A_C_HORSE_THOROUGHBRED_BRINDLE"),
			['Level'] = 16
		}
	}
}

--Sillas complementos
Config.MenuSillas = {
   {
      ['Text'] = "Saddle #1",
      ['SubText'] = "",
      ['Desc'] = "Saddle 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x106961A8,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Saddle #2",
      ['SubText'] = "",
      ['Desc'] = "Saddle 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x14168240,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Saddle #3",
      ['SubText'] = "",
      ['Desc'] = "Saddle 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x150D0DAA,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Saddle #4",
      ['SubText'] = "",
      ['Desc'] = "Saddle 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x15FB6791,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Saddle #5",
      ['SubText'] = "",
      ['Desc'] = "Saddle 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x17153A45,
          ['Precio'] = 10
      }
   }
}

--Mantas complementos
Config.MenuMantas = {
   {
      ['Text'] = "Blanket #1",
      ['SubText'] = "",
      ['Desc'] = "Blanket 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x127E0412,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Blanket #2",
      ['SubText'] = "",
      ['Desc'] = "Blanket 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x19C5E80C,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Blanket #3",
      ['SubText'] = "",
      ['Desc'] = "Blanket 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x20D4A0BF,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Blanket #4",
      ['SubText'] = "",
      ['Desc'] = "Blanket 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x2286EE30,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Blanket #5",
      ['SubText'] = "",
      ['Desc'] = "Blanket 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x269583CA,
          ['Precio'] = 10
      }
   }
}

--Crin Complementos

Config.MenuCrines = {
   {
      ['Text'] = "Mane #1",
      ['SubText'] = "",
      ['Desc'] = "Mane 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x130E341A,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Mane #2",
      ['SubText'] = "",
      ['Desc'] = "Mane 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x14098229,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Mane #3",
      ['SubText'] = "",
      ['Desc'] = "Mane 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x16923E26,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Mane #4",
      ['SubText'] = "",
      ['Desc'] = "Mane 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x18199F48,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Mane #5",
      ['SubText'] = "",
      ['Desc'] = "Mane 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x1A5A45B6,
          ['Precio'] = 10
      }
   }
}

--Colas complementos
Config.MenuColas = {
   {
      ['Text'] = "Tail #1",
      ['SubText'] = "",
      ['Desc'] = "Tail 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x12DBBBAF,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Tail #2",
      ['SubText'] = "",
      ['Desc'] = "Tail 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x17EB79D3,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Tail #3",
      ['SubText'] = "",
      ['Desc'] = "Tail 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x1A3B721B,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Tail #4",
      ['SubText'] = "",
      ['Desc'] = "Tail 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x1BB5EAA1,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Tail #5",
      ['SubText'] = "",
      ['Desc'] = "Tail 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x1E9A18C2,
          ['Precio'] = 10
      }
   }
}

--Alforjas complementos
Config.MenuAlforjas = {
   {
      ['Text'] = "Bedroll #1",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x1D4EDB88,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #2",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x20AA8620,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #3",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x293E17B3,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #4",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x2AEFF6CA,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #5",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x5277E9BA,
          ['Precio'] = 10
      }
   }
}

--Petates Complementos

Config.MenuPetates = {
   {
      ['Text'] = "Bedroll #1",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x12F0DF9F,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #2",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x18BB6B30,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #3",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x1B43F045,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #4",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x27543EBB,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Bedroll #5",
      ['SubText'] = "",
      ['Desc'] = "Bedroll 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x36BEDD90,
          ['Precio'] = 10
      }
   }
}

--Estribos Complementos
Config.MenuEstribos = {
   {
      ['Text'] = "Stirups #1",
      ['SubText'] = "",
      ['Desc'] = "Stirups 1 for horses",
      ['Param'] = {
          ['Hash'] = 0x3B3AB08,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Stirups #2",
      ['SubText'] = "",
      ['Desc'] = "Stirups 2 for horses",
      ['Param'] = {
          ['Hash'] = 0x587DD49F,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Stirups #3",
      ['SubText'] = "",
      ['Desc'] = "Stirups 3 for horses",
      ['Param'] = {
          ['Hash'] = 0x67AF7302,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Stirups #4",
      ['SubText'] = "",
      ['Desc'] = "Stirups 4 for horses",
      ['Param'] = {
          ['Hash'] = 0x75178DD2,
          ['Precio'] = 10
      }
   },
   {
      ['Text'] = "Stirups #5",
      ['SubText'] = "",
      ['Desc'] = "Stirups 5 for horses",
      ['Param'] = {
          ['Hash'] = 0x8246282F,
          ['Precio'] = 10
      }
   }
}

Config.Texto = "Press [ENTER] to open stable"

Config.Coords = {
	{name="Establo", x = -366.08,    y = 787.01,     z = 116.17},
	{name="Establo", x = -874.02,    y = -1364.78,   z = 43.53},
	{name="Establo", x = -1777.02,   y = -440.15,    z = 154.96},
	{name="Establo", x = 2502.5,     y = -1455.33,   z = 46.31},
	{name="Establo", x = 2970.73,    y = 1427.97,    z = 44.71}
}

Config.SpawnHorse = {
    vector4( -373.302,  786.904,    116.169,    273.18 ),
    vector4( -863.746,  -1366.289,  43.549,     88.17 ),
    vector4( -1773.523, -441.351,   155.046,    72.45 ),
    vector4( 2508.778,  -1450.003,  46.404,     79.792 ),
    vector4( 2967.735,  1431.232,   44.753,     215.782 ),
}

Citizen.CreateThread(function()
    for _, st in pairs(Config.Coords) do
        print(st.x)
        print(st.name)
        local blip = N_0x554d9d53f696d002(1664425300, st.x, st.y, st.z)
        SetBlipSprite(blip, 469827317, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, st.name)
    end  
end)
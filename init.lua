-- ortie
minetest.register_craftitem("ortie:ortie", {
	description = "Ortie",
	inventory_image = "ortie_ortie.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "ortie:ortie_1")
	end,
	on_use = minetest.item_eat(-1),
	groups = {
		not_in_creative_inventory = 1
	},
})

-- graines ortie
minetest.register_craftitem("ortie:graines_ortie", {
	description = "graines d'ortie",
	inventory_image = "ortie_graines_ortie.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "ortie:ortie_1")
	end,
	on_use = minetest.item_eat(-2),
})

-- soupe ortie froide
minetest.register_craftitem("ortie:soupe_d_ortie_froide", {
	description = "soupe d' ortie froide",
	inventory_image = "ortie_soupe_froide.png",
	on_use = minetest.item_eat(-2),
	groups = {
		not_in_creative_inventory = 1
	},
})

-- craft pour creer la soupe d'ortie froide
minetest.register_craft({
	output = "ortie:soupe_d_ortie_froide",
	recipe = {
		{'', 'ortie:ortie', ''},
		{'farming:salt', 'bucket:bucket_water', ''},
		{'', 'farming:bowl', ''},
	}
})

-- soupe ortie chaude
minetest.register_craftitem("ortie:soupe_d_ortie_chaude", {
	description = "soupe d' ortie chaude",
	inventory_image = "ortie_soupe_chaude.png",
	on_use = minetest.item_eat(2),
	groups = {
		not_in_creative_inventory = 1
	},
})

-- craft pour chauffer la soupe d'ortie
minetest.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "ortie:soupe_d_ortie_chaude",
	recipe = "ortie:soupe_d_ortie_froide"
})

--configuration générale des plants d'ortie
local ortie_def = {
	drawtype = "plantlike",
	tiles = {"ortie_ortie_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	groups = {
		snappy = 3, flammable = 3, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
	damage_per_second = 0.5
}

-- plant d'ortie: étape 1, la jeune pousse
minetest.register_node("ortie:ortie_1", table.copy(ortie_def))

-- plant d'ortie: étape 2, le buisson
ortie_def.tiles = {"ortie_ortie_2.png"}
ortie_def.damage_per_second = 1
minetest.register_node("ortie:ortie_2", table.copy(ortie_def))

-- plant d'ortie: étape 3, le buisson en fleur
ortie_def.tiles = {"ortie_ortie_3.png"}
ortie_def.drop = "ortie:ortie"
minetest.register_node("ortie:ortie_3", table.copy(ortie_def))

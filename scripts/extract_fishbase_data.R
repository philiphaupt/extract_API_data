#extract_fishbase_data

# Installation files
#install.packages("remotes")
#remotes::install_github("ropensci/rfishbase")

#install.packages("rfishbase")

library("rfishbase")
library("dplyr")

#enter a list of species - the following species are KEIFCA's priority species:
species_list <- c("Buccinum undatum", "Ostrea edulis", "Mytilus edulis", "Pecten maximus", "Aequipecten opercularis", "Cerastoderma edule", "Homarus gammarus", "Cancer pagurus", "Maja squinado", "Dicentrarchus labrax", "Gadus morhua", "Solea solea", "Raja clavata", "Pleuronectes platessa", "Herring", "Clupea harengus", "Scomber scombrus", "Mustelus mustelus", "Platichthys flesus", "Mugil cephalus", "Galeorhinus galeus")



#check the names are valid and recognised - link this with worms from before?
fish_validated_list <- validate_names(species_list)


# get fishbasedata
fish_dat <- species(fish_validated_list)



# REPEAT for sealife base to get infofor nonfish
sealife <- load_taxa(server="sealifebase")


#Native Oyster
# Mussels
# Queen scallop
# King scallop
# Whelk
# Cockle
# Lobster
# Crab
# 
# Bass
# Cod
# Sole
# 
# Thornback Ray
# Plaice
# Herring
# Mackerel
# Smooth hound
# Flounder
# Grey Mullet
# Tope

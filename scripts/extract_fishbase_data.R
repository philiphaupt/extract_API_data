# Aim obtain data from fishbase and sealife base for the priority species
# Done by extracting data from their RESTful APIs with a switch in the  server

# Required installations:
# install.packages("rfishbase")
# install.packages("tidyverse")

# Librararies
library("rfishbase")
library("tidyverse")

# Settings:
# Set the server to Fishbase/or ensure it is set to fish base as opposed to sealife base
options(FISHBASE_API = "https://fishbase.ropensci.org/fishbase")

# Prepare/provide a list of species using scientific/latin species names - the following species are KEIFCA's priority species:
species_list <- c("Buccinum undatum", # Whelk
                  "Ostrea edulis", # Native Oyster
                  "Mytilus edulis", # Mussels
                  "Venerupis pullastra", # carpet shell  - clam
                  "Ruditapes decussatus",# Grooved Carpetshell 
                  "Ruditapes philippinarum", # Manila clam or Shortnecked clam
                  "Callista chione", # Hard clam or smooth clam
                  "Mercenaria mercenaria", # Hard clam
                  "Donax trunculus", # wedge clam , other species of Donax too, but not listed here
                  "Pecten maximus", # King scallop
                  "Aequipecten opercularis", # Queen scallop
                  "Cerastoderma edule", # Cockle
                  "Homarus gammarus", # Lobster
                  "Cancer pagurus", # Crab
                  "Maja squinado", # Crab
                  "Dicentrarchus labrax", # Bass
                  "Gadus morhua", # Cod
                  "Solea solea", # Sole
                  "Raja clavata", # Thornback Ray
                  "Pleuronectes platessa", # Flounder
                  "Clupea harengus", # Herring
                  "Scomber scombrus", # Mackerel
                  "Mustelus mustelus", # Smooth hound
                  "Platichthys flesus", # Plaice
                  "Mugil cephalus", # Grey Mullet
                  "Galeorhinus galeus") # Tope
# Note that I have added both King and Queen scallops and spider and edible crabs at this stage - may be refined in future.

################### FISH
#check the names are valid and recognised - link this with worms from before?
fish_validated_list <- validate_names(species_list)

# get fishbasedata
fish_dat <- species(fish_validated_list) %>% 
glimpse()


################# SHELLFISH
# REPEAT for sealife base to get info for shellfish.
# Settings:
## Set the server to Fishbase/or ensure it is set to fish base as opposed to sealife base
#options(FISHBASE_API = "https://fishbase.ropensci.org/sealifebase")
#or
sealife <- load_taxa(server="sealifebase") # loads taxonomic data into cache - speeds up processing, but not required

# match the species, and return their data from the cached sealife data
shellfish_phylo <- sealife[c(match(species_list, sealife$Species)),] %>% 
  glimpse() # and show a few records
rm(sealife)

shellfish_validated_list <- validate_names(shellfish_phylo$Species, server = "sealifebase")

shellfish_dat <- species(shellfish_validated_list, server = "sealifebase")

## Join the data and select which columns to retain
species_dat <-
  bind_rows(shellfish_dat, fish_dat) %>% # done by appending/binding the rows, not select which columns are retained
  select("SpecCode",
         "Species",
         "FBname",
         "Fresh",
         "Brack",
         "Saltwater", 
         "BodyShapeI",
         "DemersPelag",
         "AnaCat",
         "DepthRangeShallow",
         "DepthRangeDeep",
         "DepthRangeComShallow",
         "DepthRangeComDeep",
         "LongevityWild",
         "LongevityCaptive",
         "Vulnerability",
         "Length",
         "LTypeMaxM",
         "LengthFemale",
         "LTypeMaxF",             
         "CommonLength",
         "LTypeComM",
         "CommonLengthF",
         "LTypeComF",             
         "Weight",
         "WeightFemale",
         "Importance",            
         "Remarks7",
         "PriceCateg",
         "PriceReliability",
         "LandingStatistics",
         "Landings",              
         "MainCatchingMethod",
         "II",
         "MSeines",
         "MGillnets",
         "MCastnets",
         "MTraps",
         "MSpears",
         "MTrawls",
         "MDredges",
         "MLiftnets",
         "MHooksLines",
         "MOther",
         "UsedforAquaculture",
         "LifeCycle",
         "UsedasBait",
         "GameFish",
         "Dangerous",
         "Electrogenic",
         "Comments") %>% 
  
  glimpse

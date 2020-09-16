# Aim: Get the data from Worms database into a csv file that can be imported into postgresql

#install.packages("worrms")

library("worrms")

#test with whelk
worms_id <- worrms::wm_name2id_(species_list)

# now get classifcation data
worms_class_dat <- worrms::wm_classification_(worms_id)


# get common names
worms_common_names_dat <- worrms::wm_common_id_(worms_id)

#
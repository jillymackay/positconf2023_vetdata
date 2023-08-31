

vet <- (grp = c("Roslin", "R(D)SVS", "Edinburgh"),
              achievements = c(list("Dolly the Sheep",
                                    "COVID Experts",
                                    "Bioinformatics"),
                               list("Day 1 Competent Vets",
                                    "World leading veterinary care"),
                               list("Supporting Higher Education Globally",
                                    "Mission Statements")))



vet <- tibble(grp = c("R(D)SVS", "Roslin", "Edinburgh"),
              achievements = c(list("Dolly the Sheep", "Covid Experts", "Bioinformatics"),
                              list("Day 1 Competent Vets", "World Leading Care"),
                              list("International Impact")))
achievements <- list("Roslin" = c("Dolly the Sheep", "Covid Experts", "Bioinformatics"),
                     "R(D)SVS" = c("Day 1 Competent Vets", "One World Health"),
                     "Edinburgh" = c("International Impact", "Local Impact"))


teaching <- tibble("Public Engagement" = c("Open Educational Resources (MOOCs)"),
                   "Undergraduate" = c("Bachelors of Veterinary Medicine and Surgery",
                                       "Bachelors of Science (Agriculture)",
                                       "Bachelors of Science (Veterinary Science)*"),
                   "Postgraduate Taught Courses" = c("Applied Animal Behaviour and Animal Welfare (On Campus)",
                                                     "Animal Biosciences (On Campus)",
                                                     "Planetary Health (Blended)",
                                                     "Sustainable Lands and Cities (Blended)",
                                                     "Advanced Clinical Practice (Online)",
                                                     "Advanced Veterinary Practice (Online)",
                                                     "Applied Conservation Genetics with Wildlife Forensics (Online)",
                                                     "Applied Poultry Science (Online)",
                                                     "Clinical Animal Behaviour (Online)",
                                                     "Conservation Medicine (Online)",
                                                     "Equine Science (Online)",
                                                     "Food Safety (Online)",
                                                     "Global Food Security and Nutrition (Online)",
                                                     "International Animal Welfare, Ethics and Law (Online)",
                                                     "One Health (Online)",
                                                     "Veterinary Anaesthesia and Analgesia (Online)",
                                                     "Doctorate in Veterinary Medicine (Resident)**"),
                   "Postgraduate Research" = c("Masters by Research",
                                               "Doctor of Philosophy (PhD)"))


teaching <- tibble(Programme = c("Open Educational Resources (MOOCs)",
                                 "Bachelors of Veterinary Medicine and Surgery",
                                 "Bachelors of Science (Agriculture)",
                                 "Bachelors of Science (Veterinary Science)*",
                                 "Applied Animal Behaviour and Animal Welfare (On Campus)",
                                 "Animal Biosciences (On Campus)",
                                 "Planetary Health (Blended)",
                                 "Sustainable Lands and Cities (Blended)",
                                 "Advanced Clinical Practice (Online)",
                                 "Advanced Veterinary Practice (Online)",
                                 "Applied Conservation Genetics with Wildlife Forensics (Online)",
                                 "Applied Poultry Science (Online)",
                                 "Clinical Animal Behaviour (Online)",
                                 "Conservation Medicine (Online)",
                                 "Equine Science (Online)",
                                 "Food Safety (Online)",
                                 "Global Food Security and Nutrition (Online)",
                                 "International Animal Welfare, Ethics and Law (Online)",
                                 "One Health (Online)",
                                 "Veterinary Anaesthesia and Analgesia (Online)",
                                 "Doctorate in Veterinary Medicine (Resident)**",
                                 "Masters by Research",
                                 "Doctor of Philosophy (PhD)"),
                   Grouping = c("Public Engagement",
                                "Undergraduate",
                                "Undergraduate",
                                "Undergraduate",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Taught",
                                "Postgraduate Research",
                                "Postgraduate Research"))




teaching %>% 
  pivot_wider(names_from = "Grouping",values_from = "Programme") %>% 
  mutate(`Postgraduate Taught` = str_replace(`Postgraduate Taught`, ",", ", \\n"))




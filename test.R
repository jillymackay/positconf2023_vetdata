

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






library(tidyverse)
library(nss)
library(LaCroixColoR)

nss |> 
  filter(str_detect(string = Provider, pattern = "Edinburgh|Aberdeen|Glasgow|Scotland|Highlands|Aberdeen|SRUC"),
         Likert == "Agreement",
         Question == "Q27",
         !str_detect(string = Provider, pattern = "College"))  |>  
  mutate(Year = as.factor(Year))  |>  
  ggplot(aes(x = Provider, y = PercRespondents, fill =  Year)) +
  geom_bar(position = position_dodge(preserve = "single"), stat = "identity", colour = "black") +
  geom_errorbar(aes(ymin=ConfMin, ymax=ConfMax), position=position_dodge(preserve = "single")) +
  scale_fill_manual(values = (lacroix_palette(name = "CranRaspberry")),
                    name = "Year") +
  theme_classic()+
  theme(legend.position = "bottom", axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  scale_y_continuous(labels = scales::percent) 




widenss <- nss %>% 
  filter(str_detect(string = Provider, pattern = "Edinburgh|Aberdeen|Glasgow|Scotland|Highlands|Aberdeen|SRUC|Heriot"),
         Likert == "Agreement",
         Question == "Q27",
         !str_detect(string = Provider, pattern = "College")) %>%
  pivot_wider(names_from = c(Year), values_from = c(PercRespondents, ConfMin, ConfMax), id_cols = Provider)

widenss %>% 
  ggplot() +
  geom_segment(aes(x = 1, xend = 2, 
                   y = PercRespondents_2017, 
                   yend = PercRespondents_2018,
                   group = Provider,
                   color = Provider), 
               size = 1.5,
               alpha = 0.5) +
  geom_segment(aes(x = 2, xend = 3, 
                   y = PercRespondents_2018, 
                   yend = PercRespondents_2019,
                   group = Provider,
                   color = Provider), 
               size = 1.55, alpha = 0.75) +
  geom_segment(aes(x = 3, xend = 4, 
                   y = PercRespondents_2019, 
                   yend = PercRespondents_2020,
                   group = Provider,
                   color = Provider), 
               size = 1.6) +
  geom_segment(x = 1, xend =1,y = 0.55, yend =1,  col = "grey70", size = 0.5) +
  geom_segment(x = 2, xend =2,y = 0.55, yend =1,  col = "grey70", size = 0.5) +
  geom_segment(x = 3, xend =3,y = 0.55, yend =1,  col = "grey70", size = 0.5) +
  geom_segment(x = 4, xend =4,y = 0.55, yend =1,  col = "grey70", size = 0.5) +
  geom_segment(x = 0, xend =4,y = 0.9, yend =0.9,  col = "grey90", size = 0.5) +
  geom_segment(x = 0, xend =4,y = 0.8, yend =0.8,  col = "grey90", size = 0.5) +
  geom_segment(x = 0, xend =4,y = 0.7, yend =0.7,  col = "grey90", size = 0.5) +
  geom_segment(x = 0, xend =4,y = 0.6, yend =0.6,  col = "grey90", size = 0.5) +
  geom_text(aes(x = x, y = y, label = label),
            data = data.frame(x = 1:4, 
                              y = 0.5,
                              label = c("2017", "2018", "2019", "2020")),
            col = "grey30",
            size = 6) +
  theme_minimal() + 
  ggrepel::geom_text_repel(aes(x = 4, 
                               y = PercRespondents_2020, 
                               label = paste0(Provider, ", ", scales::percent(PercRespondents_2020, accuracy = 1)),
                               color = Provider),
                           nudge_x = 0.8,
                           segment.size = 1,
                           segment.alpha = 0.3,
                           direction = "y",
                           family = "Calibri", fontface = "bold" ) +
  scale_x_continuous(limits = c(1, 5.5)) +
  scale_y_continuous(labels = scales::percent,
                     limits = c(0.5,1)) +
  #  scale_colour_manual(values = (lacroix_palette(name = "Pure", type = "continuous", n = 12)),
  #                    name = "Year") +
  nord::scale_color_nord(palette = "aurora", reverse = T) +
  theme(axis.line.x = element_blank(),
        axis.text.x = element_blank(),
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y=element_blank(),
        legend.position = "none",
        plot.title = element_text(color =  "#306489" , size = 20, family = "Calibri", hjust = 0.5),
        plot.subtitle = element_text(color =  "#306489" , size = 18, family = "Calibri", hjust = 0.5),
        plot.background = element_rect(fill = "#faf5f5", color = "#f0f0f0")) +
  labs(title = "NSS Overall Satisfaction for selected Scottish HE Providers", family = "Calibri",
       subtitle = "(Over last four years)") +
  annotate("text", label = "https://github.com/jillymackay/NSSAnalyses", x = 5, y = 0.5, size = 3, colour = "#486090", family = "Calibri Light" ) 





nss |> 
  filter(str_detect(string = Provider, pattern = "University of Edinburgh"),
         Likert == "Agreement",
         Question == "Q27",
         !str_detect(string = Provider, pattern = "College"))  |>  
  mutate(Year = as.factor(Year))  |>  
  ggplot(aes(x = Provider, y = PercRespondents, fill =  Year)) +
  geom_bar(position = position_dodge(preserve = "single"), stat = "identity", colour = "black") +
  geom_errorbar(aes(ymin=ConfMin, ymax=ConfMax), position=position_dodge(preserve = "single")) +
  scale_fill_manual(values = (lacroix_palette(name = "CranRaspberry")),
                    name = "Year") +
  theme_classic()+
  theme(legend.position = "bottom", axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  scale_y_continuous(labels = scales::percent) 




nss |> 
  filter(str_detect(string = Provider, pattern = "University of Edinburgh"),
         Likert == "Agreement",
         Question == "Q27") |> 
  mutate(Year = factor(Year)) |> 
  

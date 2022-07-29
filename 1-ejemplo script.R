library(tidyverse)
library(lubridate)
options(scipen=999)



salario <- read.csv("https://infra.datos.gob.ar/catalog/sspm/dataset/57/distribution/57.1/download/indice-salario-minimo-vital-movil-valores-mensuales-pesos-corrientes-desde-1988.csv")%>%
  select(indice_tiempo, salario_minimo_vital_movil_mensual)%>%
  rename(salario_minimo=salario_minimo_vital_movil_mensual)%>%
  mutate(indice_tiempo=ymd(indice_tiempo))



head(salario)


salario %>%
  filter(indice_tiempo >= "2020-01-01" & indice_tiempo <= "2022-07-01") %>%
  ggplot() +
  aes(x = indice_tiempo, y = salario_minimo) +
  geom_line(size = 0.5, colour = "#112446") +
  labs(
    x = "Indice de tiempo",
    y = "Monto en pesos",
    title = "Evolución del salario mínimo,vital y móvil en Argentina.",
    subtitle = "Período de análisis 2020 a 2022.",
    caption = "Elaboración propia en base a datos de la Subsecretaría de Programación Macroeconómica."
  ) +
  theme_minimal()



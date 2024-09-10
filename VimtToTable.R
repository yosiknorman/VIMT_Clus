#!/usr/bin/Rscript

library(raster)
library(maps)
library(openxlsx)
rm(list = ls())

Qi = brick("middleman/Qi.nc")
Qj = brick("middleman/Qj.nc")
VIMFC = brick("middleman/VIMFC.nc")

SIP = colorRampPalette(c("red", "white", "green"))

DMYH = seq(as.POSIXct("2023-01-01"), length = dim(VIMFC)[3], by = "hour")

DMY = substr(DMYH, 1, 10)
DMYU = unique(DMY)

IdTime = list()
Slist = list()
INI = rep(0, 744)
for(i in 1:length(DMYU)){
  IdTime[[i]] = which(DMY == DMYU[i])
  INI[IdTime[[i]]] = i
}



VIMFC_Day = stackApply(VIMFC, INI, fun = mean)
MT_QU_Day = stackApply(Qi, INI, fun = mean)
MT_QV_Day = stackApply(Qj, INI, fun = mean)

names(VIMFC_Day) = as.Date(DMYU)
names(MT_QU_Day) = as.Date(DMYU)
names(MT_QV_Day) = as.Date(DMYU)

VIMFC_DayTabl = rasterToPoints(VIMFC_Day)
MT_QU_DayTabl = rasterToPoints(MT_QU_Day)
MT_QV_DayTabl = rasterToPoints(MT_QV_Day)


write.csv(VIMFC_DayTabl, file = "output/VIMFC_DayTabl.csv", row.names = F)
write.csv(MT_QU_DayTabl, file = "output/MT_QU_DayTabl.csv", row.names = F)
write.csv(MT_QV_DayTabl, file = "output/MT_QV_DayTabl.csv", row.names = F)





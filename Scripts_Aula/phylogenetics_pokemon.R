library(ape)
library(phangorn)
library(phytools)
library(adegenet)
library(ggtree)
library(phylobase)
library(ggplot2)
library(RColorBrewer)


data <- read.phyDat("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Dados/Pokemon Phylogeny/PokeTypesMovesMesquite.phy", format = "phylip", type = "USER", levels = c(0,1))

data$Charizard

class(data)
data

distmatrix <- dist.ml(data)

treeUPGMA <- upgma(distmatrix)
treeNJ <- nj(distmatrix)     

parsimony(treeUPGMA, data)
parsimony(treeNJ, data)


treePars <- optim.parsimony(treeUPGMA, data)

treeRatchet <- pratchet(data, trace = 0)

parsimony(c(treePars, treeRatchet), data)

plot(treePars)
plot(treeRatchet)

# https://bioconductor.org/packages/release/bioc/vignettes/ggtree/inst/doc/treeManipulation.html
ggtree(treeRatchet, layout = "circular") + geom_tiplab2(size = 2, aes(angle = angle))




library(dplyr)
tiplabels <- treePars$tip.label
#write.csv(tiplabels, "tiplabels.csv") # Retirar * e ?
tiplabels <- read.csv("C:/Users/piato/Dropbox/BIOLOGIA/R/MEU CURSO DE R/Material Minicurso Introdução ao R/Dados/Pokemon Phylogeny/tiplabels.csv")

setdiff(pokemons3$Name, tiplabels$Names) # O que tem em pokemons3$Names, mas não em tiplabels
setdiff(tiplabels$Names, pokemons3$Name) # O que tem em tiplabels, mas não em pokemons3$Names

tiplabels2 <- intersect(tiplabels$Names, pokemons3$Name)

pokemons4 <- pokemons3[match(tiplabels2, pokemons3$Name),]

#tiplabels[order(match(tiplabels2, pokemons3$Name)), ]

length(tiplabels2) == length(pokemons4$Name)

treePars$tip.label <- tiplabels2




groupInfo <- split(tiplabels2, pokemons4$Type_1)

groupedinfo <- groupOTU(treePars, groupInfo)

ggtree(groupedinfo, layout = "circular", aes(color = group), size = 1) + geom_tiplab2(size = 2, aes(angle = angle)) + theme(legend.position="right") #scale_color_manual(values = c("chartreuse3", "gray22", "goldenrod2", "gold1", "deeppink3", "gray", "darkorange2", "dimgray", "darkorchid4", "darkolivegreen4", "darkorange4", "deepskyblue3", "burlywood3", "blueviolet", "coral2", "wheat4", "slategrey", "slateblue4"))




library("DiagrammeR")


grViz("digraph course {
rankdir = LR
node [shape = box, style=filled]
layout = dot
compound =true
#color = crimson

subgraph clusterA{

label = 'ChIPseeker'
style = dashed
rank = same

roi [label = 'Region of interest']
gene2 [label = 'Gene in proximity']

}

subgraph clusterB{

rankdir = LR
label = 'Over Representation Analysis'
style = dashed
rank = same

subgraph cluster0 {
label = 'clusterProfiler'

enrichGO
enrichKEGG 
enrichMKEGG
enricher [label = 'enricher\nfor MSigDb, wikiPathway\nand many others']
}

subgraph cluster1 {
label = 'DOSE'

enrichDO
enrichNCG
enrichDGN
}


subgraph cluster2 {
label = 'ReactomePA'

enrichPathway
}

subgraph cluster3 {
label = 'meshes'

enrichMeSH
}


}



subgraph clusterC{

label = 'Gene Set Enrichment Analysis'
style = dashed
rank = same


subgraph cluster0 {
label = 'clusterProfiler'

gseGO
gseKEGG 
gseMKEGG
GSEA [label = 'GSEA\nfor MSigDb, wikiPathway\nand many others']
}

subgraph cluster1 {
label = 'DOSE'

gseDO
gseNCG
gseDGN
}


subgraph cluster2 {
label = 'ReactomePA'

gsePathway
}

subgraph cluster3 {
label = 'meshes'

gseMeSH
}

}



subgraph clusterD{

label = 'Visualization using enrichplot'
style = dashed
rank = same

subgraph cluster1 {
label = 'ORA only'
barplot
goplot
}

subgraph cluster2 {
label = 'ORA & GSEA'
dotplot
upsetplot
heatplot
cnetplot
emapplot
}

subgraph cluster3 {
label = 'GSEA only'
gseaplot
gseaplot2
gsearank
ridgeplot
}

}


subgraph clusterE{

label = 'Remove redundant terms'
style = dashed
rank = same

simplify [label = 'simplify for GO only\nby GOSemSim']
}

subgraph clusterF{

label = 'Compare different conditions'
style = dashed
rank = same

comparecluster [label = 'compareCluster\nby clusterProfiler']
}

rnaseq [label = 'RNA-seq']
gene [label = 'Gene of interest\ne.g. from pull-down']
genelist [label='Ranked gene list']
de [label = 'Differential expressed gene']
roi->gene2
#ora [label = 'Over Representation Analysis']
#gsea [label = 'Gene Set Enrichment Analysis']
microarray -> de
rnaseq -> de
microarray -> genelist #gseKEGG[lhead=clusterC]
rnaseq -> genelist
de -> enrichKEGG[lhead=clusterB]
gene -> enrichKEGG[lhead=clusterB]
gene2 -> enrichKEGG[lhead=clusterB]
enrichKEGG -> enrichNCG [style = invis]
enrichPathway -> enrichMeSH  [style = invis]
gseKEGG -> gseNCG [style = invis]
gsePathway -> gseMeSH  [style = invis]
genelist -> gseMKEGG [lhead=clusterC]
others [label = 'Other sources']

others -> genelist
enrichDGN -> barplot [ltail=clusterB]
enrichDGN -> dotplot [ltail=clusterB]
enrichDGN -> upsetplot [ltail=clusterB]
enrichDGN -> heatplot [ltail=clusterB]
enrichDGN -> cnetplot [ltail=clusterB]
enrichDGN -> emapplot [ltail=clusterB]
enrichGO -> goplot

gseDGN -> ridgeplot [ltail=clusterC]
gseDGN -> dotplot [ltail=clusterC]
gseDGN -> upsetplot [ltail=clusterC]
gseDGN -> heatplot [ltail=clusterC]
gseDGN -> cnetplot [ltail=clusterC]
gseDGN -> emapplot [ltail=clusterC]
gseDGN -> gseaplot [ltail=clusterC]
gseDGN -> gseaplot2 [ltail=clusterC]
gseDGN -> gsearank [ltail=clusterC]


enrichGO -> simplify
gseGO -> simplify

enrichMeSH -> comparecluster[ltail=clusterB]
}")  -> x

x

#yyplot::gv2file(x,  file = 'clusterProfiler.pdf')
yyplot::gv2file(x, file = 'figures/clusterProfiler-diagram.png' )

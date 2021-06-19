#####################################################################################
#
# Name: IllianCode.R
#
# Description: Replicates Illian et al (2013) doi: 10.1111/2041-210x.1201 Analysis
#
#####################################################################################

### Housekeeping
set.seed(467)

formula = outcome.matrix ~ -1 + beta.pat + beta.status
+ retama.pat + retama.status + topo.pat + topo.status
+ f(lsp.pat, model="iid") + f(lsp.status,
                              model="iid")
+ f(inla.group(constructed.pat), model="rw1",
    hyper=param.cc)
+ f(inla.group(constructed.status), model="rw1",
    hyper=param.cc)
+ f(I.pat, model="rw2d", nrow=2*n.columns,
    ncol=n.columns,
    replicate=plot.pat, hyper=param.spatial)
+ f(I.status, model="rw2d", nrow=2*n.columns,
    ncol=n.columns,
    replicate=plot.status, hyper=param.spatial)

result = inla(formula, family =c
              ("poisson","binomial"),
              data = outcome.matrix, Ntrials = Ntrials, E = Area,
              control.compute=list(dic=T))
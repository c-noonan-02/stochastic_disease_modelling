### Script to analyse summary statistics from simulated outbreaks.
# NB: This should be used in conjunction with "spillover_sim_update.R", Exercise 2b
# - it relies on outputs from that script and will not work if the variables are not defined appropriately!

# What fraction of simulated outbreaks went extinct?
frac.extinct <- length(sims.extinct)/num.sims
print(paste("fraction extinct: ",frac.extinct,sep=""))

# Amongst outbreaks that went extinct, in which generation did this occur?
gen.extinct <- num.gens[sims.extinct]-1 # subtract 1 if you want to call the initial generation "gen 0"
hist(gen.extinct,breaks=seq(from=0.5,to=max(gen.extinct)+0.5,by=1),probability=T)
# summary stats:
print(paste("median extinction time: ",median(gen.extinct),"; maximum extinction time: ",max(gen.extinct),sep=""))

# What was the peak number of infected individuals in any generation?
# look at all simulations together:
hist(num.inf.peak)
# look only at outbreaks that went extinct:
peak.extinct <- num.inf.peak[sims.extinct]
hist(peak.extinct,breaks=seq(from=0.5,to=max(peak.extinct)+0.5,by=1))
print(paste("peak number infected if outbreak went extinct: median = ",median(peak.extinct),sep=""))
# look only at outbreaks that remained active (not extinct) by the end of the simulation:
peak.active <- num.inf.peak[sims.active]
hist(peak.active)
print(paste("peak number infected if outbreak still active: median = ",median(peak.active),sep=""))

# What was the total outbreak size, i.e. cumulative number of infected hosts, by the end of the simulation?
# look at all simulations together:
hist(outbreak.size)
# look only at outbreaks that went extinct:
outbreak.size.extinct <- outbreak.size[sims.extinct]
hist(outbreak.size.extinct,breaks=seq(from=0.5,to=max(outbreak.size.extinct)+0.5,by=1))
print(paste("Outbreak sizes for extinct outbreaks: median = ",median(outbreak.size.extinct),
            "; min = ",min(outbreak.size.extinct), "; max = ",max(outbreak.size.extinct),sep=""))
# look only at outbreaks that remained active (not extinct) by the end of the simulation:
outbreak.size.active <- outbreak.size[sims.active]
hist(outbreak.size.active)
print(paste("Outbreak sizes for active outbreaks: median = ",median(outbreak.size.active),
            "; min = ",min(outbreak.size.active), "; max = ",max(outbreak.size.active),sep=""))
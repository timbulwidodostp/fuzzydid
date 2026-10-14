{smcl}
{* *! version 1  2018-07-27}{...}
{viewerjumpto "Title" "fuzzydid##title"}{...}
{viewerjumpto "Syntax" "fuzzydid##syntax"}{...}
{viewerjumpto "Description" "fuzzydid##description"}{...}
{viewerjumpto "Options" "fuzzydid##options"}{...}
{viewerjumpto "Options specific to estimators with covariates" "fuzzydid##optionsest"}{...}
{viewerjumpto "Example" "fuzzydid##example"}{...}
{viewerjumpto "Stored results" "fuzzydid##stored_results"}{...}
{viewerjumpto "References" "fuzzydid##references"}{...}
{viewerjumpto "Authors" "fuzzydid##authors"}{...}
{viewerjumpto "Also see" "fuzzydid##alsosee"}{...}
{cmd:help fuzzydid}{right: ({browse "https://doi.org/10.1177/1536867X19854019":SJ19-1: st0560})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 17 19 2}{...}
{p2col :{cmd:fuzzydid} {hline 2}}Estimation with fuzzy
differences-in-differences designs{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:fuzzydid} {it:Y G T D} {ifin} 
[{cmd:,} 
{cmd:did} 
{cmd:tc}
{cmd:cic}
{cmd:lqte} 
{cmdab:newc:ateg(}{it:numlist}{cmd:)}
{cmdab:num:erator}
{cmdab:part:ial}
{cmd:nose}
{cmdab:cl:uster(}{it:varname}{cmd:)}
{cmd:breps(}{it:#}{cmd:)}
{cmdab:eqt:est}
{cmdab:tag:obs}
{cmdab:cont:inuous(}{it:varlist}{cmd:)}
{cmdab:quali:tative(}{it:varlist}{cmd:)}
{cmd:modelx(}{it:reg1 reg2 reg3}{cmd:)}
{cmd:sieves}
{cmdab:sieveo:rder(}{it:#}{cmd:)}]{p_end}

{pstd}
{it:Y} is the outcome variable.{p_end}

{pstd}
{it:G} is the group variable or variables.  We refer to section 4.2 of
Chaisemartin, D'Haultf{c 0x9c}uille, and Guyonvarch (2019) for more details on
how to construct this variable or these variables.{p_end}

{pstd}
{it:T} is the time-period variable.{p_end}

{pstd}
{it:D} is the treatment variable.  It can be any ordered variable.


{marker description}{...}
{title:Description}

{pstd}
{cmd:fuzzydid} computes estimators of local average and quantile treatment
effects in fuzzy differences-in-differences (DID) designs, following de
Chaisemartin and D'Haultf{c 0x9c}uille (2018).  It also computes their
standard errors and confidence intervals.{p_end}

{pstd}
A detailed introduction to this command is given in Chaisemartin,
D'Haultf{c 0x9c}uille, and Guyonvarch (2019).{p_end}


{marker options}{...}
{title:Options}

{phang}
{cmd:did} computes the Wald DID estimator.{p_end}

{phang}
{cmd:tc} computes the Wald time-corrected (TC) estimator.{p_end}

{phang}
{cmd:cic} computes the Wald changes-in-changes (CIC) estimator.  This option
can be specified only when no covariates are included in the estimation.

{phang}
{cmd:lqte} computes the estimators of the local quantile treatment effects
(LQTE) for quantiles of order 5%, 10%, ..., 95%.  This option can be specified
only when D, G, and T are binary and no covariates are included in the
estimation.{p_end}

{pstd}
At least one of the four options above is required.  If several of these
options are specified, the command computes all the estimators requested by
the user.

{phang}
{cmd:newcateg(}{it:numlist}{cmd:)} groups some values of the treatment
together when estimating the Wald TC and Wald CIC.  This option may be useful
when the treatment takes many values, as explained in section 3.3 of
Chaisemartin, D'Haultf{c 0x9c}uille, and Guyonvarch (2019).  One must specify
the upper bound of each set of values of the treatment one wants to group.
For instance, if D takes the values {0,1,2,3,4.5,7,8}, and one wants to group
together units with D in {0,1,2}, D in {3,4.5}, and D in {7,8}, one must write
{cmd:newcateg(2 4.5 8)}.{p_end}

{phang}
{cmd:numerator} computes only the numerators of the Wald DID, Wald TC, and
Wald CIC estimators.  As explained in section 3.3.3 in the supplement of de
Chaisemartin and D'Haultf{c 0x9c}uille (2018), this option is useful to
conduct placebo tests of the assumptions underlying each estimator.

{phang}
{cmd:partial} computes the bounds on the local average treatment effects in
the absence of a "stable" control group.  This option can be specified only
when no covariates are included in the estimation.{p_end}

{phang}
{cmd:nose} computes only the estimators, not their standard errors.{p_end}

{phang}
{cmd:cluster(}{it:varname}{cmd:)} computes the standard errors of the
estimators using a block bootstrap at the {it:varname} level.  Only one
clustering variable is allowed.{p_end}

{phang}
{cmd:breps(}{it:#}{cmd:)} specifies the number of bootstrap replications.  The
default is {cmd:breps(50)}.{p_end}

{phang}
{cmd:eqtest} performs an equality test between the estimands when the user
specifies at least two of the {cmd:did}, {cmd:tc}, and {cmd:cic} options.

{phang}
{cmd:tagobs} creates a new variable named {cmd:tagobs}, which identifies the
observations used by {cmd:fuzzydid}.

{marker optionsest}{...}
{title:Options specific to estimators with covariates}

{phang}
{cmd:continuous(}{it:varlist}{cmd:)} specifies the names of all the continuous
covariates that must be included in the estimation.{p_end}

{phang}
{cmd:qualitative(}{it:varlist}{cmd:)} specifies the names of all the
qualitative covariates that must be included in the estimation.  For each
variable, indicator variables are created for each value except one and
included as controls in the estimation.{p_end}

{phang}
{cmd:modelx(}{it:reg1 reg2 reg3}{cmd:)} specifies which parametric method
should be used to estimate the conditional expectations in the Wald DID or
Wald TC estimators with covariates.  {it:reg1} specifies which method should
be used to estimate E(Y_{gt}|X) and E(Y_{dgt}|X).  {it:reg2} specifies which
method should be used to estimate E(D_{gt}|X).  When D is not binary,
{it:reg3} specifies which method should be used to estimate P(D_{gt}=d|X) for
all possible values of d.  The possible methods are {cmd:ols}, {cmd:logit},
and {cmd:probit}.  For instance, if the user writes 
{cmd:modelx(ols logit logit)}, the command estimates E(Y_{gt}|X) and
E(Y_{dgt}|X) by ordinary least squares and E(D_{gt}|X) and P(D_{gt}=d|X) by a
logistic regression.  The {cmd:logit} and {cmd:probit} options can be used
only with binary variables.{p_end}

{phang}
{cmd:sieves} indicates that the conditional expectations in the Wald DID and
Wald TC with covariates should be estimated nonparametrically.{p_end}

{pstd}
When covariates are included in the estimation, and neither {cmd:modelx()} nor
{cmd:sieves} is specified, the command estimates by default all conditional
expectations by ordinary least squares.{p_end}

{phang}
{cmd:sieveorder(}{it:#}{cmd:)} specifies the order of the sieve basis when the
option {cmd:sieves} is used.  It must be greater than or equal to 2, and the
command does not allow for more than min(4800, n/5) basis functions, where n
is the number of observations.  By default, the choice of the sieve order is
done via fivefold cross-validation with a mean squared error loss
function.{p_end}


{marker example}{...}
{title:Example: Data from Gentzkow, Shapiro, and Sinkinson (2011)}
    
{phang}
{cmd:. use turnout_dailies_1868-1928.dta}{p_end}
{phang}
{cmd:. generate G1872=(fd_numdailies>0) if (year==1872)&fd_numdailies!=.&fd_numdailies>=0&sample==1}{p_end}
{phang}
{cmd:. sort cnty90 year}{p_end}
{phang}
{cmd:. replace G1872=G1872[_n+1] if cnty90==cnty90[_n+1]&year==1868}{p_end}
{phang}
{cmd:. fuzzydid pres_turnout G1872 year numdailies, did tc cic newcateg(0 1 2 45) breps(200) cluster(cnty90)}{p_end}


{marker stored_results}{...}
{title:Stored results}

{pstd}
In what follows, let {it:k} denote the number of options specified among
{cmd:did}, {cmd:tc}, and {cmd:cic}.  {cmd:fuzzydid} stores the following in
{cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalar}{p_end}
{synopt:{cmd:e(N)}} number of observations used in the estimation{p_end}

{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(b_LATE)}} a k x 1 matrix where each line corresponds to the value of one of the requested estimators{p_end}

{synopt:{cmd:e(se_LATE)}} a k x 1 matrix where each line corresponds to the
bootstrap standard errors associated with one of the requested estimators{p_end}

{synopt:{cmd:e(ci_LATE)}} a k x 2 matrix whose columns respectively store the lower and upper bounds of the 95% confidence interval computed by percentile bootstrap for each requested estimator{p_end}

{synopt:{cmd:e(b_LATE_eqtest)}} a "k choose 2" x 1 matrix that stores the value of the difference between each pair of requested estimators{p_end}

{synopt:{cmd:e(se_LATE_eqtest)}} a "k choose 2" x 1 matrix that stores the
bootstrap standard errors associated with the difference between each pair of requested estimators{p_end}

{synopt:{cmd:e(ci_LATE_eqtest)}} a "k choose 2" x 2 matrix whose columns
respectively store the lower and upper bounds of the 95% confidence
interval computed by percentile bootstrap for the difference between
each pair of requested estimators{p_end}

{synopt:{cmd:e(b_LQTE)}} a 19 x 1 matrix that stores the value of the LQTE estimator at the 5th, 10th, ..., 95th percentile{p_end}

{synopt:{cmd:e(se_LQTE)}} a 19 x 1 matrix that stores the bootstrap standard
errors associated with the 19 LQTE estimators{p_end}

{synopt:{cmd:e(ci_LATE)}} a 19 x 2 matrix whose columns respectively store the lower and upper bounds of the 95% confidence interval computed by percentile bootstrap for each LQTE estimator{p_end}


{marker references}{...}
{title:References}

{phang}
de Chaisemartin, C., and X. D'Haultf{c 0x9c}uille. 2018. Fuzzy differences-in-differences. 
{it:Review of Economic Studies} 85: 999-1028.{p_end}

{phang}
de Chaisemartin, C., X. D'Haultf{c 0x9c}uille, and Y. Guyonvarch. 2019. 
{browse "http://www.stata-journal.com/article.html?article=st0010.1177/1536867X19854019":Fuzzy differences-in-differences with Stata}.
{it:Stata Journal} 19: 435-458.

{phang}
Gentzkow, M., J. M. Shapiro, and M. Sinkinson. 2011. 
The effect of newspaper entry and exit on electoral politics.
{it:American Economic Review} 101: 2980-3018.{p_end}


{marker authors}{...}
{title:Authors}

{pstd}
Cl{c e'}ment de Chaisemartin{break}
University of California at Santa Barbara{break}
Santa Barbara, CA{break}
{browse "mailto:clementdechaisemartin@ucsb.edu":clementdechaisemartin@ucsb.edu}

{pstd}
Xavier D'Haultf{c 0x9c}uille{break}
CREST{break}
Palaiseau, France{break}
{browse "mailto:xavier.dhaultfoeuille@ensae.fr":xavier.dhaultfoeuille@ensae.fr}

{pstd}
Yannick Guyonvarch{break}
CREST{break}
Palaiseau, France{break}
{browse "mailto:yannick.guyonvarch@ensae.fr":yannick.guyonvarch@ensae.fr}


{marker alsosee}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 19, number 2: {browse "https://doi.org/10.1177/1536867X19854019":st0560}
{p_end}

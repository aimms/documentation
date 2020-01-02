Setting up RLink
****************

In order to run RLink certain conditions should hold. We will explain how these conditions can be met and who is responsible for it.

Requirements and responsibilities
=================================

RLink requires the following to be installed on the system:  

* R (version 3.0.0 or newer)
* Rcpp (version 0.12.9 or newer)
* DataLink (version 1.0.1.3 or newer)
* aimms (contained in RLink)

.. note::

    The latest R version that is compatible with RLink is 3.5.2

The R package called aimms (lower case) contains the functions SetData and GetData. In R they are in the namespace aimms because of the package name. In this way we can do :token:`aimms::SetData` and :token:`aimms::GetData` in R, so the name makes sense. Still it may be confusing with AIMMS the program or AIMMS the language. To avoid confusion, *throughout this manual we will use aimms (lower case) to refer to the R package and R namespace*.

Rlink can be run in AIMMS development platform, in AIMMS PRO and in AIMMS Cloud. 

For the AIMMS development platform, the AIMMS PRO/Cloud Client side and the AIMMS PRO Server side make sure that R and Rcpp are installed on the machine. The developer has to make sure RLink and DataLink are added to the project. The R package aimms can be installed on the machine as well. Alternatively the developer can call:

.. code::

    rlink::CheckAndInstallPackage() 

in the :token:`PostMainInitialization` procedure of the project. In this way the aimms package that is included in RLink will be installed.


For the AIMMS Cloud Server side R and Rcpp are already provided. If RLink and DataLink are added to the project, then they will be automatically fetched from the library repository. The R package aimms is not provided on the AIMMS Cloud Server, to make sure that it is always current with the latest version of RLink. To publish an app that uses RLink, the developer **must** call:

.. code::

    rlink::CheckAndInstallPackage() 

in the :token:`PostMainInitialization` procedure of the project, so that the aimms package is always being fetched from the RLink library and installed.

Installation
============

Besides AIMMS the following may need to be installed:

* R (Executable)
* Rcpp (R Package)
* RLink (AIMMS Library) 
* DataLink (AIMMS Library)
* aimms (R Package)

R and Rcpp
----------

R is not just a software environment for statistical computing. It is a community with a foundation that maintains the software as an open source project. Out of respect to this community it feels inappropriate to bundle the binaries of R with RLink. For this reason R has to be downloaded and installed independently of RLink.

R can be obtained from "The Comprehensive R Archive Network":https://cran.r-project.org/. Here you can choose the binaries you need to install R on your system, or even build it from source. Also extensive documentation is available, i.e.: "R Installation and Administration":https://cran.r-project.org/doc/manuals/r-release/R-admin.html .

Information of :token:`Rcpp` can be found "here":https://cran.r-project.org/web/packages/Rcpp/index.html. :token:`Rcpp` can be installed just like any other R packages from the command line using:

.. code-block:: console
    
    R CMD INSTALL [options] [-l lib] Rcpp

or on windows using :token:`Rcmd.exe`:

.. code-block:: console

    Rcmd.exe INSTALL [options] [-l lib] Rcpp

Alternatively the package can be installed inside R using:

.. code-block:: r

    install.packages("Rcpp")

It will prompt and ask for a repository if no default repository is specified. Alternatively you can specify a repository, like:

.. code-block:: r

    install.packages("Rcpp", repos='http://cran.us.r-project.org')


.. important::

    The function :token:`install.packages` is a normal R function and can  also be called in RLink. The AIMMS Cloud Server requires the linux version of the packages and on CRAN they are only provided as source. This means that an app installing a package will always have to download and compile it, every time the app is launched, adding considerable to the startup time.

RLink and DataLink
------------------

**RLink** and **DataLink** are made available by AIMMS in the library repository. In order to include these libraries, in AIMMS go to the menu **File** / **Library Manager...**.

In the library manager the panel on the left shows the library configuration of the current project. On the right there are choices to add a library. Click option **Add Library from Repository...** and a new window opens. On the left there is a list of **Available Libraries/Versions**. Clicking the name shows details about the latest version of the library. Clicking the AIMMS logo in front of it also shows previous versions.

By clicking on _RLink_ in the left panel you'll see its dependency on DataLink with the required version. The Library Manager is smart enough to add DataLink to the list when you click the "_Select_" button at the bottom. The window closes and we are back in the window showing the library structure. The two libraries, RLink and DataLink, are now visible in the left pane, that shows the "new" library configuration of the project. By clicking "_OK_" the project is updated and the RLink and DataLink libraries are added to the project.

When publishing in our cloud, the RLink and DataLink libraries don't have to be included in the :token:`aimmspack`. The :token:`.aimms` file of the project contains all information needed for  fetching these libraries from the repository, and that will happen automatically in the cloud.

R package aimms
----------------

The **aimms** package is included in RLink. In this way RLink and the aimms package can be developed further, and the most recent version of aimms can be released together with newer versions of RLink.

It is possible to install aimms at a location that is in the :token:`.libPath` of R. This is the directory list used by R to find installed packages. It is possible to install aimms at a location that is in the :token:`.libPath`. In that case RLink can call R and R can find and use the aimms package.

To install the aimms package locally we first need to know where the package is. To do this open an AIMMS project for which library RLink is added. The libraries from the repository typically get installed in a writable :token:`temp` directory. Go to library RLink and look at the data of string parameter :token:`rlink::LIBRARY_ROOT`. 

Open R and at the prompt you can use :token:`setwd` to change the current working directory. Here we copy the string from :token:`rlink::LIBRARY_ROOT` between quotes as argument in :token:`setwd`. It will look something like this:

.. code-block:: r

    setwd("C:\\Users\\alice\\ ... \\vc120_x64_Release\\")

Here :token:`...` is used because the string can be quite long. On windows we also have to "double" the backslashes otherwise R will complain.

Now the current working directory of R is the location where RLink is installed. You can check this using :token:`getwd()`. The package aimms is located in directory R, so we have to do

.. code-block:: r

    setwd("R")

Doing 

.. code-block:: r
    
    list.files()
    
will show the files in the current directory. One of the files looks like :token:`aimms_0.1.0.zip`. The numbers can be different, but this is the aimms package that has to be installed. Next we have to decided where we want to install the aimms package. In R you can do

.. code-block:: r

    .libPaths()

to show the default locations where R looks for packages. To pick a single location we can simply select one. i.e.

.. code-block:: r

    .libPaths()[1] 

will pick the first location from :token:`.libPaths()`. Now we are ready to install the package. We can do:

.. code-block:: r

    install.packages("aimms_0.1.0.zip",lib=.libPaths()[1],repos=NULL,type="source")

Where we passed the arguments:

* The name of the package: :token:`aimms_0.1.0.zip`, which is the file we found in the R directory.
* The location where we want to install it: :token:`.libPaths()[1]`, which is the first directory in the search path of R.
* Using :token:`repos=NULL`, which says that we want to load it from disk rather then a repository.
* The :token:`type="source"` indicates that there is no C/C++ code that needs to be compiled.

For situations where the AIMMS developer does not have control over the R installation (AIMMS PRO server or the AIMMS Cloud), the following function is available:

.. js:function:: rlink::CheckAndInstallPackage()

    This functions calls the R script :token:`cniaimms.r` that is located in the R directory of RLink. It will add this directory to the :token:`.libPath` and installs the aimms package here if no aimms package is found.

The function :token:`rlink::CheckAndInstallPackage` should be called in the :token:`MainInitialization` of the project. The first time the project is run the installation may happen. In all subsequent runs of the project no installation is needed, but the R directory still should be added to the :token:`.libPath`.



R-packages on the AIMMS cloud
=============================

.. csv-table:: 
   :header: "Package", "Version", "Package", "Version", "Package", "Version"
   :widths: 20, 20, 20, 20, 20, 20
    
    assertthat,0.2.1,httpuv,1.5.2,readr,1.3.1
    backports,1.1.5,httr,1.4.1,readxl,1.3.1
    base,3.4.4,iterators,1.0.12,rematch,1.0.1
    base64enc,0.1-3,jsonlite,1.6,reshape2,1.4.3
    BH,1.69.0-1,KernSmooth,2.23-15,rgdal,1.4-4
    bit,1.1-14,labeling,0.3,rgeos,0.5-2
    bit64,0.9-7,later,1.0.0,rio,0.5.16
    boot,1.3-20,lattice,0.20-38,rlang,0.4.0
    boxr,0.3.4,lazyeval,0.2.2,rpart,4.1-15
    brew,1.0-6,leafem,0.0.1,satellite,1.0.1
    callr,3.3.2,leaflet,2.0.2,scales,1.0.0
    cellranger,1.1.0,leafpop,0.0.1,scclust,0.2.2
    class,7.3-15,leaps,3,sf,0.8-0
    classInt,0.4-2,littler,0.3.3,shiny,1.4.0
    cli,1.1.0,lmtest,0.9-37,sourcetools,0.1.7
    clipr,0.7.0,locfit,1.5-9.1,sp,1.3-1
    cluster,2.0.7-1,magrittr,1.5,spatial,7.3-11
    codetools,0.2-16,maptools,0.9-8,splines,3.4.4
    colorspace,1.4-1,mapview,2.7.0,stats,3.4.4
    compiler,3.4.4,markdown,1.1,stats4,3.4.4
    crayon,1.3.4,MASS,7.3-51.1,stringi,1.3.1
    crosstalk,1.0.0,Matrix,1.2-16,stringr,1.4.0
    curl,4.2,methods,3.4.4,survival,2.44-1.1
    data.table,1.12.6,mgcv,1.8-28,svglite,1.2.2
    datasets,3.4.4,mime,0.7,sys,3.3
    DBI,1.0.0,munsell,0.5.0,systemfonts,0.1.1
    digest,0.6.21,nlme,3.1-137,tcltk,3.4.4
    distances,0.1.8,nnet,7.3-12,tibble,2.1.3
    docopt,0.6.1,openssl,1.4.1,tidyselect,0.2.5
    dplyr,0.8.3,openxlsx,4.1.0.1,timeDate,3043.102
    e1071,1.7-2,parallel,3.4.4,tools,3.4.4
    ellipsis,0.3.0,pillar,1.4.2,TSA,1.2
    fansi,0.4.0,pkgconfig,2.0.3,tseries,0.10-47
    fastmap,1.0.1,plogr,0.2.0,TTR,0.23-5
    forcats,0.4.0,plyr,1.8.4,units,0.6-5
    foreach,1.4.7,png,0.1-7,urca,1.3-0
    forecast,8.9,prettyunits,1.0.2,utf8,1.1.4
    foreign,0.8-70,processx,3.4.1,utils,3.4.4
    fracdiff,1.4-2,progress,1.2.2,uuid,0.1-2
    gdalUtils,2.0.1.14,promises,1.1.0,vctrs,0.2.0
    gdtools,0.2.1,ps,1.3.0,viridis,0.5.1
    ggplot2,3.2.1,purrr,0.3.3,viridisLite,0.3.0
    glue,1.3.0,quadprog,1.5-7,webshot,0.5.1
    graphics,3.4.4,quantmod,0.4-15,withr,2.1.2
    grDevices,3.4.4,R.methodsS3,1.7.1,xfun,0.1
    grid,3.4.4,R.oo,1.22.0,xtable,1.8-4
    gridExtra,2.3,R.utils,2.9.0,xts,0.11-2
    gtable,0.3.0,R6,2.4.0,yaml,2.2.0
    haven,2.1.1,raster,3.0-7,zeallot,0.1.0
    hms,0.5.1,RColorBrewer,1.1-2,zip,2.0.4
    htmltools,0.4.0,Rcpp,1.0.2,zoo,1.8-6




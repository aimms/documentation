
.. image:: Images/aimms-logo-s-rgb.png
				:align: center

.. raw:: html

			<br>
			<h1 align="center">Welcome to the AIMMS documentation !</h1>
			<br>
			<br>


.. raw:: html

	<style>
		#content {
			width:100%;
			max-width:1000px;    /* A. max horizontal number of boxes =~ int(A/B) */
			margin:0 auto;
			text-align:left;    /* (left|center) align last boxes and the set vert. line */
			/*background-color:#AAA; */
		}
		.box {
			display: inline-block;
			overflow:hidden;      /* hide scroll bars */
			min-height: 100px;    /* B. change the vertical numb. of boxes */
			width: 170px;        /* C. change the horizontal numb. of boxes*/
			height: 170px;
			margin:40px;          /*  boxes separator */
			vertical-align: top; /* (top|bottom) align boxes */
			text-align:justify;
			padding:6pt;
			background-color:#EDEFF2;/*#c5c6c7;*/
			border-radius: 5px;
			margin: 10px 10px 50px;
			flex: 1 0 270px;
			min-width: 270px; 
		}
		
		.box:hover{
			opacity: 0.7;
			cursor: pointer;
			transition: all .2s ease-in-out;
		}
		
		.box h1{
			border-bottom: 1px solid black;
			margin-left: 10px !important;
			margin-right: 10px !important;
			margin-bottom:25px !important;
		}
		
		.box:hover h1{
			opacity: 1;
			/*color: #000081;*/
		}
		
		.box p{
			color : black ;
			font-style: italic;
		}
		
	</style>
	
	<div id="content">
		<a href="webui/index.html">
			<div class="box">
				<h1 align="center">WebUI - Dev</h1>
				<p align="center">Developer documentation for the AIMMS WebUI</p>
			</div>
		</a>
		<a href="webui-user/index.html">
			<div class="box">
				<h1 align="center">WebUI - User</h1>
				<p align="center">User documentation for the <br>AIMMS WebUI</p>
			</div>
		</a>
		<a href="pro/index.html">
			<div class="box">
				<h1 align="center">PRO</h1>
				<p align="center">The AIMMS Publishing and Remote Optimization platform</p>
			</div>
		</a>
		<a href="cloud/index.html">
			<div class="box">
				<h1 align="center">Cloud Platform</h1>
				<p align="center">The AIMMS cloud platform for deploying your AIMMS apps</p>
			</div>
		</a>
		<a href="unit-test/index.html">
			<div class="box">
				<h1 align="center">Unit Test</h1>
				<p align="center">The AIMMS unit test library for adding unit test to your AIMMS models</p>
			</div>
		</a>
		<a href="cdm/index.html">
			<div class="box">
				<h1 align="center">CDM</h1>
				<p align="center">The AIMMS Collaborative Data Management library</p>
			</div>
		</a>
		<a href="datalink/index.html">
			<div class="box">
				<h1 align="center">Datalink</h1>
				<p align="center">The AIMMS datalink library for importing and exporting <br>row-based data</p>
			</div>
		</a>
		<a href="rlink/index.html">
			<div class="box">
				<h1 align="center">R-Link</h1>
				<p align="center">The AIMMS R-link library for calling R scripts from within your model</p>
			</div>
		</a>
		<a href="scnavigator/index.html">
			<div class="box">
				<h1 align="center">SC Navigator</h1>
				<p align="center">The AIMMS SC Navigator suite of supply chain apps</p>
			</div>
		</a>
	</div>

.. image:: Images/icons/favicon.png
    :scale: 0
   
.. toctree::
   :maxdepth: 3
   :hidden:

   webui/index
   webui-user/index
   pro/index
   cloud/index
   unit-test/index
   cdm/index
   datalink/index
   rlink/index
   scnavigator/index
   
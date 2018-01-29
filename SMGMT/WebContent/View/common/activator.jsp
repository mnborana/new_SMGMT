<div class="modal fade" id="modal-20" role="dialog"
	aria-labelledby="modalLabelwarn">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-warning">
				<h4 class="modal-title text-white" id="modalLabelwarn" style="margin-right: 85%;">Activator</h4>
			</div>
			<div class="modal-body">
				Enter Key
				<p>
					<input id="getKey" name="getKey" type="text" placeholder="Activator Key..." class="form-control">
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn  btn-warning" onclick="activateKey()">Activate</button>
				<button class="btn  btn-warning" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- =================================================================================================== -->
<div class="modal fade" id="modal-17" role="dialog"	aria-labelledby="modalLabelinfo">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h4 class="modal-title text-white" id="modalLabelinfo" style="margin-right: 85%;">Message</h4>
			</div>
			<div class="modal-body">
				<ul>
					<li><strong id="keyMsg"></strong></li>
				</ul>
			</div>
			<div class="modal-footer">
				<button id="keyBTN1" class="btn  btn-info" style="display: none;"  onclick="window.location.reload()">OK</button>
				<button id="keyBTN2" class="btn  btn-info" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function activateKey(){
	var str=document.getElementById("getKey").value;
	if(str==""){
		return;
	}
	var xhttp =new XMLHttpRequest();
	try{
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var getData=this.responseText;
				if (getData==0){
					document.getElementById("keyMsg").innerHTML="You Entered The Wrong Key!";
					$('#modal-17').modal('show');
					document.getElementById("keyMsg").style.color = "#ff3333";
					document.getElementById("keyBTN1").style.display="none";
					document.getElementById("keyBTN2").style.display="";
				}
				if (getData==1){
					document.getElementById("keyMsg").innerHTML="This Serial Key Is Expired!";
					$('#modal-17').modal('show');
					document.getElementById("keyMsg").style.color = "#ff3333";
					document.getElementById("keyBTN1").style.display="none";
					document.getElementById("keyBTN2").style.display="";
				}
				if (getData==2){
					document.getElementById("keyMsg").innerHTML="Activation Successfully!";
					$('#modal-17').modal('show');
					document.getElementById("keyMsg").style.color = "#009900";
					document.getElementById("keyBTN1").style.display="";
					document.getElementById("keyBTN2").style.display="none";
				}
				if (getData==3){
					document.getElementById("keyMsg").innerHTML="Something Wrong with Activator, Please Call Service Provider!";
					$('#modal-17').modal('show');
					document.getElementById("keyMsg").style.color = "#ff3333";
					document.getElementById("keyBTN1").style.display="none";
					document.getElementById("keyBTN2").style.display="";
				}
				

				}					
			}
		xhttp.open("POST", "/SMGMT/YearActivator?getKey="+str, true);
		xhttp.send();
	}catch(e){
		alert("Unable to Connect Server!");
	}
}
</script>
<html>
<head>
		<title> mypage</title>
		<style>
			table,td,th
			{
				border:1px solid red;
			}
			td,th
			{
				padding:10px;
				
			}
			table
			{
				margin:auto;
				
			}
	</style>
	
		<script>

					var xmlhttp;
			
					function getData()
					{
						
						xmlhttp=new XMLHttpRequest();
						xmlhttp.onload=show; // value of onload property is name of that function which should be called when response is loaded from server
						var rno=document.form1.rno.value;
						xmlhttp.open("get","http://localhost:8082/student/" + rno);
						xmlhttp.send();
												
					}
						// show function is displaying response on webpage
					function show()
					{
							alert(xmlhttp.responseText);

							// parse function accept JSON String and gives us javascript object
							
							var obj=JSON.parse(xmlhttp.responseText); 

							// obj==>[rno=1 marks=90] javascript object
							
							document.form1.marks.value=obj.marks;
					}


					function deleteData()
					{
						xmlhttp=new XMLHttpRequest();
						xmlhttp.onload=display; // value of onload property is name of that function which should be called when response is loaded from server
						var rno=document.form1.rno.value;
						xmlhttp.open("delete","http://localhost:8082/student/" + rno);
						xmlhttp.send();
						
					}

					function show2()
					{
						document.getElementById("p1").innerHTML=xmlhttp.responseText;							
					}


					function postData(button)
					{
						xmlhttp=new XMLHttpRequest();
						
						xmlhttp.onload=display; // value of onload property is name of that function which should be called when response is loaded from server
						var rno=document.form1.rno.value;
						var marks=document.form1.marks.value;

						var obj={"rno":rno,"marks":marks}; // javascript object
						
						if(button.value=="post")
							xmlhttp.open("post","http://localhost:8082/student");
						else
							xmlhttp.open("put","http://localhost:8082/student");


						xmlhttp.setRequestHeader('Content-type', 'application/json')
						xmlhttp.send(JSON.stringify(obj)); // stringify will convert javascript object into JSON string
					
					}		


					function show3()
					{
						alert(xmlhttp.responseText);							
					}


					function getAllData()
					{
						
						xmlhttp=new XMLHttpRequest();
						xmlhttp.onload=display; // value of onload property is name of that function which should be called when response is loaded from server
						var rno=document.form1.rno.value;
						xmlhttp.open("get","http://localhost:8082/students");
						xmlhttp.send();
												
					}
					
					function display()
					{
							//alert("hello");

								
							var table=document.getElementById("table1");
							table.innerHTML="";

							var headingrow=document.createElement("tr");

							var rnoth=document.createElement("th");
							var marksth=document.createElement("th");
		
							var heading1=document.createTextNode("rno");
							var heading2=document.createTextNode("marks");
		
							rnoth.appendChild(heading1);
							marksth.appendChild(heading2);
							
							headingrow.appendChild(rnoth);
							headingrow.appendChild(marksth);
							
							table.appendChild(headingrow);


							var data=xmlhttp.responseText;

		//					alert(data);
							data=data.substring(1,data.length-1);
							
							//alert(data);

							var newstr="";
							
							for(var i=0;i<data.length;i++)
							{
							//	alert(data[i]);
								var character=data[i];
								if(character==',' && data[i+1]=='{')
								{
									newstr=newstr+"#";
								}
								else
								{
									newstr=newstr+character;
								}
								
							}

			//				alert(newstr);
							
							var jsonstrings=newstr.split("#");

							
							for(var i=0;i<jsonstrings.length;i++)
							{

									var jsonrecord=jsonstrings[i];
									
				//					alert(jsonrecord);

									
									
									var object=JSON.parse(jsonrecord);
									
									var row=document.createElement("tr");
									
									
									var rnotd=document.createElement("td");
									var markstd=document.createElement("td");
				
									var rno=document.createTextNode(object.rno);
									var marks=document.createTextNode(object.marks);
				
									rnotd.appendChild(rno);
									markstd.appendChild(marks);
		
									row.appendChild(rnotd);
									row.appendChild(markstd);
									
									table.appendChild(row);
									
							}
					}
					
					
			</script>
		
</head>

<body>

<!-- var rno=document.form1.rno.value -->

<form name ="form1">
			
			<input type="text" name="rno" placeholder="Roll Number"><br><br>
			
			<input type="text" name="marks" placeholder="Marks"><br><br>
			
			
			<input type="button" value="post" onclick="postData(this)">
			<input type="button" value="get" onclick="getData()">
			<input type="button" value="put" onclick="postData(this)">
			<input type="button" value="delete" onclick="deleteData()">
			<input type="button" value="getall" onclick="getAllData()">

			<br><br><br>
						
			<table id="table1">
				
			</table>
			
</form>

<p id="p1"> Test </p>

</body>

</html>
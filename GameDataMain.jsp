<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<style>
*{
padding:0;
margin:0;

}
.main_contents{
	width:800px;
	margin: 0 auto;
	
}
body{
	background-color:black;
	color:white;
}
.title{
	font-weight:bold;
	font-size:90px;
	padding-top:20px;
	
	
}
.sub_title{
	font-size:20px;


}
.game_contents{
	border-radius:10px;
	height:auto;
	display: flex;
	flex-wrap: wrap;

}
#game_data_table{
	color:white;
}
.image_items img{
	width:50%;
	border-radius:10px;
	
}
.items{
display:flex;


}
</style>
<body>
<div class="main_contents">
<p class="title"> New and trending </p>
<p class="sub_title">Based on player counts and release date</p>

<div class="game_contents">
	<div class="items">
		<div class="image_container">
		<div class="image_items" v-for="(data, idx) in background_image" :key="idx">
			<img v-bind:src="data">
			
		</div>
		</div>
		<div class="name_container">
		<div class="name" v-for="(data, idx) in name" :key="idx">
			<p> {{name[idx]}} </p>
		</div>
		</div>
		
	</div>


</div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
const app = new Vue({
    el: '.main_contents',
    data: {
    	background_image:[],
    	name:[],
    	
    },
    mounted(){
    	axios.get('/GetGameDataMain')
 	   .then((res)=>{
 		   console.log(res.data);
 		  for(var i = 0 ; i < Object.keys(res.data.results).length ; i++){
 			console.log(res.data.results[i].metacritic);
 			this.metacritic = res.data.results[i].metacritic;
 			console.log(res.data.results[i]);
 			console.log(res.data.results[i].background_image);
 			this.background_image.push(res.data.results[i].background_image);
 			this.name.push(res.data.results[i].name);
 			
 			console.log(res.data.results[i].name);
 		   
 		   }
 		   
 	   })	
    },
    created(){
    	
    },
    methods: {
 
    	
    },
});

</script>
</html>

function toggletable(){
			var x = document.getElementById("hiddenTable");
			var y = document.getElementById("pending");
		    if (x.style.display === "none") {
		    	y.style.display = "none";
		        x.style.display = "block";
		    } else {
		        x.style.display = "none";
		    }
		}
		function pendingPost(){
			var x = document.getElementById("hiddenTable");
			var y = document.getElementById("pending");
			if (x.style.display === "block" || y.style.display === "none") {
				x.style.display = "none"
				y.style.display = "block";
		    } else {
		        y.style.display = "none";
		    }
		}

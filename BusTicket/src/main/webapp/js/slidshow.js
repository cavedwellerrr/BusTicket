function startslidshow(imgId,images){
	
	let index = 0;
		const slideshow=document.getElementById(imgId);

		setInterval(() => {
			index=(index+1)% images.length;
			slideshow.style.opacity = 0;
			
			setTimeout(() => {
				
				slideshow.src=images[index];
				slideshow.style.opacity=1;
				
			}, 1000);
			
		}, 4000);
}
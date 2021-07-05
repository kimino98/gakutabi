document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('review_image')){
    const ImageList = document.getElementById('image-list')

    const createImageHTML = (blob) => {
      
     const imageElement = document.createElement('div')
     imageElement.setAttribute('class', "image-element")
     let imageElementNum = document.querySelectorAll('.image-element').length
     
     const blobImage = document.createElement('img')
     blobImage.setAttribute('src', blob)

     const inputHTML = document.createElement('input')
     inputHTML.setAttribute('id', `review_image_${imageElementNum}`)
     inputHTML.setAttribute('name', 'review[images][]')
     inputHTML.setAttribute('type', 'file')

     imageElement.appendChild(blobImage)
     imageElement.appendChild(inputHTML)
     ImageList.appendChild(imageElement)

     inputHTML.addEventListener('change', (e) => {
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
     })
   }

    document.getElementById('review_image').addEventListener('change', function(e){
    
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});



　　
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class starRating extends HTMLElement{
    getvalue(){
        return this.getAttribute('value');
    }
    
    setvalue(val){
        this.setAttribute('value', val);
        this.highlight(this.value*2 - 1);
    }
    
    highlight(index){
        this.stars.forEach((star, i) => {
            star.classList.toggle('full', i * 2 < index);
            star.classList.toggle('half', i * 2 == index);
        });
    }
    
    constructor(){
        super();
        this.stars = [];
        for(let i = 0; i < 5; i++){
            let s = document.createElement('div');
            s.className = 'star';
            this.appendChild(s);
            this.stars.push(s);
        }
        
        this.value = this.value;
        
        this.addEventListener('click', e => {
            let box = this.getBoundingClientRect(),
                starIndex = Math.floor((e.pageX - box.left)/box.width * this.stars.length * 2);
            this.value = (starIndex + 1) / 2;
            this.highlight(starIndex);
        });
    }
}

class starRating_r extends HTMLElement{
    get value(){
        return this.getAttribute('value');
    }
    
    set value(val){
        this.setAttribute('value', val);
        this.highlight(this.value*2 - 1);
    }
    
    highlight(index){
        this.stars.forEach((star, i) => {
            star.classList.toggle('full', i * 2 < index);
            star.classList.toggle('half', i * 2 == index);
        });
    }
    
    constructor(){
        super();
        this.stars = [];
        for(let i = 0; i < 5; i++){
            let s = document.createElement('div');
            s.className = 'star';
            this.appendChild(s);
            this.stars.push(s);
        }
        this.value = this.value;
    }
}

window.customElements.define('x-star-rating', starRating);
window.customElements.define('r-star-rating', starRating_r);
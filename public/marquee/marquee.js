/*************************************************************
 * This script is developed by Arturs Sosins aka ar2rsawseen, http://webcodingeasy.com
 * Fee free to distribute and modify code, but keep reference to its creator
 *
 * Marquee class can be used to create horizontal or vertical marquee elements in websites
 * This class rotates all provided html elements, so marquee will never be empty
 * Marquee div element can be customized using css styles
 * There are also customizations for rotating speed and separator, etc
 *
 * For more information, examples and online documentation visit: 
 * http://webcodingeasy.com/JS-classes/Javascript-marquee
**************************************************************/
var marquee = function(id){
	//some configuration
	this.elem = document.getElementById(id);
	var ob = this;
	this.children = [];
	this.visible = [];
	
	this.conf = {
		step: 1,
		interval: 10,
		stop_on_hover: true,
		separator: "",
		backwards: false
	};
	
	this.construct = function(){
		this.elem.style.overflow = "hidden";
		var position = compute_style(this.elem, "position");
		if(position != "absolute" && position != "fixed")
		{
			this.elem.style.position = "relative";
		}
		while(this.elem.childNodes[0])
		{
			var elem = this.elem.childNodes[0];
			this.elem.removeChild(elem);
			if(elem.nodeType == 1)
			{
				var div = document.createElement("div");
				div.style.position = "absolute";
				div.style.whiteSpace = "pre";
				div.appendChild(elem);
				this.children.push(div);
				if(this.conf.separator != "")
				{
					div = document.createElement("div");
					div.innerHTML = this.conf.separator;
					div.style.position = "absolute";
					div.style.whiteSpace = "pre";
					this.children.push(div);
				}
			}
		}
		var lastpos = 0;
		for(var i = 0; true; i++)
		{
			this.cur = i%this.children.length;
			var elem = this.children[this.cur].cloneNode(true);
			this.elem.appendChild(elem);
			var length = this.visible.push(elem);
			this.visible[length-1].style[this.pos] = lastpos + "px";
			if(lastpos > this.elem[this.size])
			{
				break;
			}
			lastpos += this.visible[length-1][this.size];
		};
		if(this.conf.backwards)
		{
			this.children.reverse();
		}
		if(this.conf.stop_on_hover)
		{
			add_event(ob.elem, "mouseover", function(){
				if(ob.timer)
				{
					clearTimeout(ob.timer);
				}
			});
			add_event(ob.elem, "mouseout", function(){
				ob.timer = setTimeout(move_elements, ob.conf.interval);
			});
		}
		move_elements();
	};

	//move elements
	var move_elements = function(){
		var first;
		var last;
		for(var i in ob.visible)
		{
			if(!first)
			{
				first = ob.visible[i];
			}
			last = ob.visible[i];
			if(!ob.conf.backwards)
			{
				ob.visible[i].style[ob.pos] = (parseInt(ob.visible[i].style[ob.pos]) - ob.conf.step) + "px";
			}
			else
			{
				ob.visible[i].style[ob.pos] = (parseInt(ob.visible[i].style[ob.pos]) + ob.conf.step) + "px";
			}
		}
		if(!ob.conf.backwards)
		{
			if(parseInt(first.style[ob.pos]) + first[ob.size] < 0)
			{
				ob.visible.shift();
				ob.elem.removeChild(first);
			}
			if(parseInt(last.style[ob.pos]) <= ob.elem[ob.size])
			{
				ob.cur = (ob.cur+1)%ob.children.length;
				var elem = ob.children[ob.cur].cloneNode(true);
				ob.elem.appendChild(elem);
				elem.style[ob.pos] = (parseInt(last.style[ob.pos]) + last[ob.size]) + "px";
				ob.visible.push(elem);
			}
		}
		else
		{
			if(parseInt(first.style[ob.pos]) >= 0)
			{
				ob.cur = (ob.cur+1)%ob.children.length;
				var elem = ob.children[ob.cur].cloneNode(true);
				ob.elem.appendChild(elem);
				elem.style[ob.pos] = (parseInt(first.style[ob.pos]) - elem[ob.size]) + "px";
				ob.visible.unshift(elem);
			}
			if(parseInt(last.style[ob.pos]) > ob.elem[ob.size])
			{
				ob.visible.pop();
				ob.elem.removeChild(last);
			}
		}
		ob.timer = setTimeout(move_elements, ob.conf.interval);
	};
	
	//add event
	var add_event = function(element, type, listener){
		if(element.addEventListener)
		{
			element.addEventListener(type, listener, false);
		}
		else
		{
			element.attachEvent('on' +  type, listener);
		}
	};
	
	//compute style
	var compute_style = function(elem, style){
		if(document.defaultView)
		{
			return document.defaultView.getComputedStyle(elem,null).getPropertyValue(style);
		}
		else
		{
			//IE way
			return elem.currentStyle[style];
		}
	};
	
	this.horizontal = function(config){
		if(config)
		{
			for(var opt in config){
				this.conf[opt]= config[opt];
			}
		}
		this.pos = "left";
		this.size = "offsetWidth";
		this.apos = "top";
		this.construct();
	};
	
	this.vertical = function(config){
		if(config)
		{
			for(var opt in config){
				this.conf[opt]= config[opt];
			}
		}
		this.pos = "top";
		this.size = "offsetHeight";
		this.apos = "left";
		this.construct();
	};
}
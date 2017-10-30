<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<%--   <link rel="stylesheet" href="<%=request.getContextPath()%>/Shuffle/css/prism.css" /> --%>
<%--   <link rel="stylesheet" href="<%=request.getContextPath()%>/Shuffle/css/normalize.css" /> --%>
<%--   <link rel="stylesheet" href="<%=request.getContextPath()%>/Shuffle/css/style.css" /> --%>
<%--   <link rel="stylesheet" href="<%=request.getContextPath()%>/Shuffle/css/shuffle-styles.css" /> --%>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!--   	<script src="https://unpkg.com/core-js/client/shim.min.js"></script> -->

<%-- 	<script src="<%=request.getContextPath()%>/Shuffle/js/prism.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/Shuffle/dist/shuffle.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/Shuffle/js/site-nav.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/Shuffle/js/demos/homepage.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/Shuffle/js/animated-favicon.js"></script> --%>
  

  <link href="https://plus.google.com/u/0/100210640453700033824" rel="author" />



  

  <!-- Prefetch DNS for external assets -->
  <link rel="dns-prefetch" href="https://fonts.gstatic.com">
  <link rel="dns-prefetch" href="https://www.google-analytics.com">
  <link rel="dns-prefetch" href="https://unpkg.com">

  <link rel="stylesheet" href="Shuffle/css/prism.css" />
  <link rel="stylesheet" href="Shuffle/css/normalize.css" />
  <link rel="stylesheet" href="Shuffle/css/style.css" />
  <link rel="stylesheet" href="Shuffle/css/shuffle-styles.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700">
  
 
<style>

</style>
	

</head>
<body>
<div class="container-fluid filter">
<div class="row-fluid">
<input class="filter__search js-shuffle-search" type="search" placeholder="Search..." />
</div>
<div class="row-fluid">
<div class="span9">
<p class="filter__label">Filter:</p>
<div class="filter-options btn-group">
<button class="btn btn--warning" data-group="wallpaper">Wallpapers</button>
<button class="btn btn--warning" data-group="graphics">Graphic Design</button>
<button class="btn btn--warning" data-group="photography">Photos</button>
<!-- <button class="btn btn--warning" data-group="3d"><a href="https://www.jqueryscript.net/tags.php?/3D/">3D</a> Renders</button> -->
</div>
</div>
<div class="span3">
<div class="m-nofloat pull-right">
<p class="filter__label">Sort:</p>
<select class="sort-options">
<option value="default">Default</option>
<option value="title">Title</option>
<option value="<a href="https://www.jqueryscript.net/time-clock/">date</a>-created">Date Created</option>
</select>
</div>
</div>
</div>
</div>
<div class="container-fluid">
<div id="grid" class="row-fluid m-row shuffle--container shuffle--fluid">

<figure class="span3 m-span3 picture-item" data-groups='["photography"]' data-date-created="2010-09-14" data-title="Baseball"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Baseball</a></figcaption>
<p class="picture-item__tags pull-right">photography</p>
</div>
</figure>
<figure class="span6 m-span3 picture-item" data-groups='["wallpaper","3d"]' data-date-created="2011-08-14" data-title="Tennis"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Tennis</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper, 3d</p>
</div>
<p class="picture-item__description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</figure>
<figure class="span3 m-span3 picture-item" data-groups='["wallpaper","3d"]' data-date-created="2009-05-27" data-title="iMac"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">iMac</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper, 3d</p>
</div>
</figure>
<figure class="span3 m-span3 picture-item picture-item--h2" data-groups='["graphics"]' data-date-created="2012-05-14" data-title="Master Chief"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Master Chief</a></figcaption>
<p class="picture-item__tags pull-right">graphics</p>
</div>
<p class="picture-item__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</figure>
<figure class="span3 m-span3 picture-item" data-groups='["wallpaper","3d"]' data-date-created="2009-09-14" data-title="Eightfold"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Eightfold</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper, 3d</p>
</div>
</figure>
<figure class="span6 m-span3 picture-item" data-groups='["photography"]' data-date-created="2012-03-14" data-title="Pumpkin"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Pumpkin</a></figcaption>
<p class="picture-item__tags pull-right">photography</p>
</div>
<p class="picture-item__description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</figure>
<figure class="span6 m-span3 picture-item picture-item--h2" data-groups='["wallpaper","3d"]' data-date-created="2013-05-19" data-title="Vestride"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Vestride</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper, 3d</p>
</div>
</figure>
<figure class="span3 m-span3 picture-item picture-item--h2" data-groups='["graphics"]' data-date-created="2013-02-01" data-title="Newegg"> <img src="image/101.jpg" alt="" height=50px width=50px />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Newegg</a></figcaption>
<p class="picture-item__tags pull-right">graphics</p>
</div>
<p class="picture-item__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</figure>
<figure class="span3 m-span3 picture-item" data-groups='["wallpaper"]' data-date-created="2000-01-01" data-title="Arc"> <img src="image/101.jpg" alt="" height="145" width="230" />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Arc</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper</p>
</div>
</figure>
<figure class="span3 m-span3 picture-item" data-groups='["photography"]' data-date-created="2012-07-04" data-title="Ground"> <img src="image/101.jpg" alt="" height="145" width="230" />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Ground</a></figcaption>
<p class="picture-item__tags pull-right">photography</p>
</div>
</figure>
<figure class="span6 m-span3 picture-item" data-groups='["wallpaper"]' data-date-created="2011-08-12" data-title="Grass"> <img src="image/101.jpg" alt="" height="145" width="230" />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Grass</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper</p>
</div>
<p class="picture-item__description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</figure>
<figure class="span3 m-span3 picture-item" data-groups='["wallpaper","3d"]' data-date-created="2013-05-19" data-title="Vestride"> <img src="image/101.jpg" alt="" height="145" width="230" />
<div class="picture-item__details clearfix">
<figcaption class="picture-item__title pull-left"><a href="http://yahoo.com.tw" target="_blank">Vestride</a></figcaption>
<p class="picture-item__tags pull-right">wallpaper, 3d</p>
</div>
</figure>
<div class="span3 m-span3 shuffle__sizer"></div>
</div>
</div>
<script>
var DEMO = (function( $ ) {
	  'use strict';

	  var $grid = $('#grid'),
	      $filterOptions = $('.filter-options'),
	      $sizer = $grid.find('.shuffle__sizer'),

	  init = function() {

	    // None of these need to be executed synchronously
	    setTimeout(function() {
	      listen();
	      setupFilters();
	      setupSorting();
	      setupSearching();
	    }, 100);

	    // instantiate the plugin
	    $grid.shuffle({
	      itemSelector: '.picture-item',
	      sizer: $sizer
	    });

	  },

	  // Set up button clicks
	  setupFilters = function() {
	    var $btns = $filterOptions.children();
	    $btns.on('click', function() {
	      var $this = $(this),
	          isActive = $this.hasClass( 'active' ),
	          group = isActive ? 'all' : $this.data('group');

	      // Hide current label, show current label in title
	      if ( !isActive ) {
	        $('.filter-options .active').removeClass('active');
	      }

	      $this.toggleClass('active');

	      // Filter elements
	      $grid.shuffle( 'shuffle', group );
	    });

	    $btns = null;
	  },

	  setupSorting = function() {
	    // Sorting options
	    $('.sort-options').on('change', function() {
	      var sort = this.value,
	          opts = {};

	      // We're given the element wrapped in jQuery
	      if ( sort === 'date-created' ) {
	        opts = {
	          reverse: true,
	          by: function($el) {
	            return $el.data('date-created');
	          }
	        };
	      } else if ( sort === 'title' ) {
	        opts = {
	          by: function($el) {
	            return $el.data('title').toLowerCase();
	          }
	        };
	      }

	      // Filter elements
	      $grid.shuffle('sort', opts);
	    });
	  },

	  setupSearching = function() {
	    // Advanced filtering
	    $('.js-shuffle-search').on('keyup change', function() {
	      var val = this.value.toLowerCase();
	      $grid.shuffle('shuffle', function($el, shuffle) {

	        // Only search elements in the current group
	        if (shuffle.group !== 'all' && $.inArray(shuffle.group, $el.data('groups')) === -1) {
	          return false;
	        }

	        var text = $.trim( $el.find('.picture-item__title').text() ).toLowerCase();
	        return text.indexOf(val) !== -1;
	      });
	    });
	  },


	  listen = function() {
	    var debouncedLayout = $.throttle( 300, function() {
	      $grid.shuffle('update');
	    });

	    // Get all images inside shuffle
	    $grid.find('img').each(function() {
	      var proxyImage;

	      // Image already loaded
	      if ( this.complete && this.naturalWidth !== undefined ) {
	        return;
	      }

	      // If none of the checks above matched, simulate loading on detached element.
	      proxyImage = new Image();
	      $( proxyImage ).on('load', function() {
	        $(this).off('load');
	        debouncedLayout();
	      });

	      proxyImage.src = this.src;
	    });
	  };

	  return {
	    init: init
	  };
	}( jQuery ));



	$(document).ready(function() {
	  DEMO.init();
	});
	
	Shuffle.options = {
		    group: 'all', // Filter group
		    speed: 250, // Transition/animation speed (milliseconds)
		    easing: 'ease-out', // css easing function to use
		    itemSelector: '', // e.g. '.picture-item'
		    sizer: null, // sizer element. Can be anything columnWidth is
		    gutterWidth: 0, // a static number or function that tells the plugin how wide the gutters between columns are (in pixels)
		    columnWidth: 0, // a static number or function that returns a number which tells the plugin how wide the columns are (in pixels)
		    delimeter: null, // if your group is not json, and is comma delimeted, you could set delimeter to ','
		    buffer: 0, // useful for percentage based heights when they might not always be exactly the same (in pixels)
		    initialSort: null, // Shuffle can be initialized with a sort object. It is the same object given to the sort method
		    throttle: $.throttle || null, // By default, shuffle will try to throttle the resize event. This option will change the method it uses
		    throttleTime: 300, // How often shuffle can be called on resize (in milliseconds)
		    sequentialFadeDelay: 150, // Delay between each item that fades in when adding items
		    supported: Modernizr.csstransforms && Modernizr.csstransitions // supports transitions and transforms
		};


</script>
<script src="https://unpkg.com/core-js/client/shim.min.js"></script>
	<!-- Syntax highlighting via Prism -->
	<script src="<%=request.getContextPath()%>/Shuffle/js/prism.js"></script>
	<!-- Shuffle! -->
	<script src="<%=request.getContextPath()%>/Shuffle/dist/shuffle.js"></script>

	<script src="<%=request.getContextPath()%>/Shuffle/js/site-nav.js"></script>

	<script src="<%=request.getContextPath()%>/Shuffle/js/demos/homepage.js"></script>

	<script src="<%=request.getContextPath()%>/Shuffle/js/animated-favicon.js"></script>
</body>
</html>
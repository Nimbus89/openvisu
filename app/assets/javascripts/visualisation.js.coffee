//= require jquery
//= require underscore
//= require backbone
//= require gridster
//= require handlebars

//= require raphael
//= require justgauge
//= require jquery.flot
//= require jquery.purr
//= require chart


//= require_tree ./templates
//= require_tree ./visualisation

jQuery(($) -> 

    app = new window.ApplicationController(window.project)

)
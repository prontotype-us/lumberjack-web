polar = require 'polar'

{get, find, create, update} = require './data'

app = polar {
    port: 9775
    static_dir: 'static'
}

app.get '/', (req, res) ->
    res.render 'app'

app.get '/trees.json', (req, res) ->
    find 'trees', req.query, (err, trees) ->
        res.json trees

app.get '/trees/:tree_id.json', (req, res) ->
    get 'trees', {id: req.params.tree_id}, (err, tree) ->
        res.json tree

app.post '/trees.json', (req, res) ->
    create 'trees', req.body, (err, created_tree) ->
        res.json created_tree

app.start()

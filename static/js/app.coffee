React = require 'react'
ReactDOM = require 'react-dom'

fetch$ = require 'kefir-fetch'

Dispatcher =
    get: (type, item_id) ->
        fetch$ 'get', "/#{type}/#{item_id}.json"

    find: (type, query) ->
        fetch$ 'get', "/#{type}.json", {query}

    create: (type, new_item) ->
        fetch$ 'post', "/#{type}.json"

    # TODO: update an item by id
    update: (args...) ->
        console.log "TODO: update function"

App = React.createClass

    getInitialState: ->
        loading: true
        items: []

    componentDidMount: ->
        @trees = Dispatcher.find 'trees', {}
        @trees.onValue @foundTrees

    foundTrees: ({items}) ->
        @setState {items, loading: false}

    render: ->
        <div className='app'>
            <div id='nav'>
                <i className='fa fa-tree' />
                <h1>Lumberjack</h1>
            </div>
            <div className='content'>
                {if @state.loading
                    <div className='loading'>Loading trees...</div>
                else
                    @state.items.map (tree, i) ->
                        <TreeItem tree=tree />
                }
            </div>
        </div>

TreeItem = React.createClass

    render: ->
        {tree} = @props
        <div key={tree.id} className='tree item'>
            {tree.species}
        </div>

ReactDOM.render <App />, document.getElementById 'app'

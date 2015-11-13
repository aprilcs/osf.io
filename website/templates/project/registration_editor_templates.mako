<!-- String Types -->
<script type="text/html" id="string">
  <span data-bind="template: {data: $data, name: format}"></span>
</script>

<script type="text/html" id="text">
  <input data-bind="valueUpdate: 'keyup',
                    value: value"
         type="text" class="form-control" />
</script>
<script type="text/html" id="match">
  <input data-bind="valueUpdate: 'keyup',
                    value: value,
                    attr.placeholder: match" type="text" class="form-control" />
</script>
<script type="text/html" id="textarea">
  <textarea data-bind="valueUpdate: 'keyup',
                       textInput: value"
            class="form-control"> </textarea>
</script>
<!-- Number Types -->
<script type="text/html" id="number">
  <input data-bind="valueUpdate: 'keyup',
                    value: value" type="text" class="form-control">
</script>
<!-- Enum Types -->
<script type="text/html" id="choose">
  <span data-bind="template: {data: $data, name: format}"></span>
</script>

<script type="text/html" id="singleselect">
  <div class="col-md-12" data-bind="foreach: {data: options, as: 'option'}">
    <p>
      <input type="radio" data-bind="checked: $parent.value,
                                     value: option"/>
      <span data-bind="text: option"></span>
    </p>
  </div>
</script>

<script type="text/html" id="object">
  <span data-bind="foreach: {data: $root.iterObject($data.properties)}">
      <div data-bind="template: {data: $root.context(value), name: value.type}"></div>
      <hr />
    </span>
  </span>
</script>

<!-- Base Template -->
<script type="text/html" id="editorBase">
  <div class="well" style="padding-bottom: 0px;">
    <div class="row">
      <div class="col-md-12">
        <div class="form-group">
          <label class="control-label" data-bind="text: title"></label>
          <span class="text-muted" data-bind="if: required">
            (required)
          </span>
          <p class="help-block" data-bind="text: description"></p>
          <span data-bind="if: help" class="example-block">
            <a data-bind="click: toggleExample">Show Example</a>
            <p data-bind="visible: showExample, text: help"></p>
          </span>
          <br />
          <br />
          <div class="row">
            <div class="col-md-12">
              <div class="form-group" data-bind="css: {has-success: $data.value.isValid}">
                <span data-bind="with: $root.context($data)">
                  <span data-bind="if: $root.showValidation">
                    <p class="text-error" data-bind="validationMessage: $data.value"></p>
                    <ul class="list-group" data-bind="foreach: $data.validationMessages">
                      <li class="list-group-item">
                        <span class="text-danger"
                              data-bind="text: $data">
                        </span>
                      </li>
                    </ul>
                  </span>
                  <div data-bind="template: {data: $data, name: type}"></div>
                  <br />
                  <span data-bind="if: $root.currentQuestion">
                    <!-- TODO(barbour-em): move this to custom question type (if we have time) -->
                    <button data-bind="click: $root.authorDialog,
                                       visible: $root.currentQuestion().title === 'Authorship' && $root.contributors().length > 1"  type="button" class="btn btn-primary">Import Contributors
                    </button>
                  </span>
                </span>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</script>

<script type="text/html" id="editor">
  <div data-bind="foreach: {data: $data.questions, as: 'question'}">
    <span data-bind="template: {data: $data, name: 'editorBase'}"></span>
  </div>
  <div class="row" >
    <div class="col-md-12">
      <div class="well" data-bind="template: {data: $data, name: 'commentable'}"></div>
    </div>
  </div>
</script>

<!-- Commentable -->
<script type="text/html" id="commentable">
    <h4> Comments </h4>
    <ul class="list-group" id="commentList" data-bind="foreach: {data: comments, as: 'comment'}">
        <li class="list-group-item">
          <h3 data-bind="text: comment.isDeleted().toString()"></h3>
          <div class="row" data-bind="if: comment.isDeleted">
            <div class="col-md-12">
              <strong><span data-bind="text: comment.getAuthor"></span></strong> deleted this comment on <em data-bind="text: comment.lastModified"></em>
            </div>
          </div>
          <div class="row" data-bind="ifnot: comment.isDeleted">
            <div class="col-md-12">
              <div class="row">
                <div class="col-sm-9">
                  <strong><span data-bind="text: comment.getAuthor"></span></strong> said ...
                </div>
                <div class="col-sm-3">
                  <div style="text-align: right;" class="btn-group">
                    <button data-bind="disable: comment.saved,
                                       click: comment.toggleSaved.bind(comment, $root.save.bind($root))" class="btn btn-success fa fa-save registration-editor-comment-save"></button>
                    <button data-bind="enable: comment.canEdit,
                                       click: comment.toggleSaved.bind(comment, $root.save.bind($root))" class="btn btn-info fa fa-pencil"></button>
                    <button data-bind="enable: comment.canDelete,
                                       click: comment.delete.bind(comment, $root.save.bind($root)) "
                            class="btn btn-danger fa fa-times"></button>
                  </div>
                </div>
              </div>
              <br />
              <div class="row">
                <div class="col-md-12 form-group">
                  <textarea class="form-control" data-bind="disable: comment.saved,
                                                            value: comment.value" type="text"></textarea>
                </div>
              </div>
            </div>
        </li>
    </ul>
    <div class="input-group">
      <input class="form-control registration-editor-comment" type="text"
             data-bind="value: nextComment,
                        valueUpdate: 'keyup'" />
      <span class="input-group-btn">
        <button class="btn btn-primary"
                data-bind="click: addComment.bind($data, $root.save.bind($root)),
                           enable: allowAddNext">Add</button>
      </span>
    </div>
</script>

<script type="text/html" id="importContributors">
    <div col-lg-12>
        <p>Select: <a data-bind="click: setContributorBoxes(true) " >All</a> | <a data-bind="click: setContributorBoxes(false)">None</a></p>
    </div>
    <div data-bind="foreach: {data: contributors, as: 'contrib'}">
        <div class="checkbox" id="contribBoxes">
            <label>
                <input type="checkbox" data-bind="value: contrib">
                <span data-bind="text: contrib"></span>
            </label>
        </div>
    </div>
    <p>If you would like to add contributors to your OSF project, you can do that on your <a href="${web_url_for('node_contributors', pid=node['id'])}">Contributors Page</a> </p>
</script>

<%include file="registration_editor_extensions.mako" />
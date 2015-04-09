<script id="profileSocial" type="text/html">

<pre>{{ko.toJSON($data)}}</pre>

    <div data-bind="if: mode() === 'edit'">

        <form role="form" data-bind="submit: submit">



          <div data-bind="sortable: {
                    data: profileWebsites(),
                    options: {
                        handle: '.sort-handle',
                        containment: '#containDrag'
                    }
                }">

                <div>

                    <div class="well well-sm sort-handle">
                        <span>Position {{ $index() + 1 }} </span>
                        <span data-bind="visible: $parent.hasMultiple()">
                            [ drag to reorder ]
                        </span>
                        <a
                                class="text-danger pull-right"
                                data-bind="click: $parent.removeContent,
                                           visible: $parent.canRemove"
                            >Remove</a>
                    </div>

                    <div class="form-group">
                        <label>Your Website</label>
                        <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
                        <input class="form-control" data-bind="value: $parent.profileWebsites()[$index()]" placeholder="http://yourwebsite.com"/>
                        </div>
                    </div>


                    <hr data-bind="visible: $index() != ($parent.profileWebsites().length - 1)" />

                </div>

            </div>

            <div>
                <a class="btn btn-default" data-bind="click: addContent">
                    Add another
                </a>
            </div>



            <div class="form-group">
                <label>ORCID</label>
                <div class="input-group">
                <span class="input-group-addon">http://orcid.org/</span>
                <input class="form-control" data-bind="value: orcid" placeholder="xxxx-xxxx-xxxx-xxxx"/>
                </div>
            </div>

            <div class="form-group">
                <label>ResearcherID</label>
                <div class="input-group">
                <span class="input-group-addon">http://researcherid.com/rid/</span>
                <input class="form-control" data-bind="value: researcherId" placeholder="x-xxxx-xxxx" />
                </div>
            </div>

            <div class="form-group">
                <label>Twitter</label>
                <div class="input-group">
                <span class="input-group-addon">@</span>
                <input class="form-control" data-bind="value: twitter" placeholder="twitterhandle"/>
                </div>
            </div>

            <div class="form-group">
                <label>GitHub</label>
                <div class="input-group">
                <span class="input-group-addon">https://github.com/</span>
                <div data-bind="css: {'input-group': github.hasAddon()}">
                    <input class="form-control" data-bind="value: github" placeholder="username"/>
                    <span
                            class="input-group-btn"
                            data-bind="if: github.hasAddon()"
                        >
                        <button
                                class="btn btn-default"
                                data-bind="click: github.importAddon"
                            >Import</button>
                    </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>LinkedIn</label>
                <div class="input-group">
                <span class="input-group-addon">https://www.linkedin.com/profile/view?id=</span>
                <input class="form-control" data-bind="value: linkedIn" placeholder="profileID"/>
                </div>
            </div>

            <div class="form-group">
                <label>ImpactStory</label>
                <div class="input-group">
                <span class="input-group-addon">https://impactstory.org/</span>
                <input class="form-control" data-bind="value: impactStory" placeholder="profileID"/>
                </div>
            </div>

            <div class="form-group">
                <label>Google Scholar</label>
                <div class="input-group">
                <span class="input-group-addon">http://scholar.google.com/citations?user=</span>
                <input class="form-control" data-bind="value: scholar" placeholder="profileID"/>
                </div>
            </div>

            <div class="padded">

                <button
                        type="button"
                        class="btn btn-default"
                        data-bind="click: cancel"
                    >Cancel</button>

                <button
                        type="submit"
                        class="btn btn-primary"
                    >Submit</button>

            </div>


            <!-- Flashed Messages -->
            <div class="help-block">
                <p data-bind="html: message, attr.class: messageClass"></p>
            </div>

        </form>

    </div>

    <div data-bind="if: mode() === 'view'">

        <table class="table" data-bind="if: hasValues()">
            <tbody data-bind="foreach: values">
                <tr data-bind="if: value">
                    <td>{{ label }}</td>
                    <td><a target="_blank" data-bind="attr.href: value">{{ text }}</a></td>
                </tr>
            </tbody>
        </table>

        <div data-bind="ifnot: hasValues()">
            <div class="well well-sm">Not provided</div>
        </div>

        <div data-bind="if: editAllowed">
            <a class="btn btn-default" data-bind="click: edit">Edit</a>
        </div>

    </div>

</script>
<script id="preRegistrationConsent" type="text/html">
  <span data-bind="html: message"></span>
  <div class="row">
    <div class="col-lg-10 col-lg-offset-1">
      <div class="checkbox checkbox-box">
        <label class="">
          <input type="checkbox" data-bind="checked: consent, value: consent">
          I agree to the terms and conditions.
        </label>
      </div>
      <button type="submit" class="btn btn-primary pull-right"
              data-bind="click: submit, css: {disabled: !consent()}">Continue</button>

      <button type="submit" class="btn btn-default pull-right"
              data-bind="click: cancel">Cancel</button>
    </div>
  </div>
</script>
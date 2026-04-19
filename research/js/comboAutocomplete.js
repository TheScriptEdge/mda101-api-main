
            function customItemRenderer(ul, item)
            {
                    return $("<li></li>")
        						        .data("item.autocomplete", item)
        						        .append("<a>" + item.label + "</a>")
        						    .appendTo(ul);

            }

            (function ($)
            {
                $.widget("custom.combobox", {
                    _create: function ()
                    {
                        this.wrapper = $("<span>")
					    .addClass("custom-combobox")
					    .insertAfter(this.element);

                        this.element.hide();
                        this._createAutocomplete();
                        this._createShowAllButton();
                        this.input.autocomplete("instance")._renderItem = customItemRenderer;
                        //$(this).data('ui-autocomplete')._renderItem = customItemRenderer;
                    },

                    _createAutocomplete: function ()
                    {
                        var selected = this.element.children(":selected"),
					    value = selected.val() ? selected.text() : "";

                        this.input = $("<input>")
					    .appendTo(this.wrapper)
					    .val(value)
					    .attr("title", "")
					    .addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left RTLDiv")
					    .autocomplete({
					        delay: 0,
					        minLength: 2,
					        source: $.proxy(this, "_source")
					    })
					    .tooltip({
					        tooltipClass: "invisible"
					    });

                        this._on(this.input, {
                            autocompleteselect: function (event, ui)
                            {
                                FakeAdd = "-999";
                                ui.item.option.selected = true;
                                this._trigger("select", event, {
                                    item: ui.item.option
                                });
                                var username = ui.item.oValue;

                                if (username == FakeAdd)
                                {
                                    $('#imgUserPic').hide();
                                    $(usersFake).show();
                                    $(fakeName).show();
                                }
                                else
                                {
                                    $(usersFake).hide();
                                    $(fakeName).hide();

                                    $.get("svcUserImage.ashx",
                                                    { UN: "" + username + "" },
                                                    function (data)
                                                    {
                                                        var obj = jQuery.parseJSON(data);
                                                        $('#imgUserPic').hide().fadeIn().attr("src", "./users/" + obj.URL);
                                                    }
                                            );
                                }
                            },

                            autocompletechange: "_removeIfInvalid"

                        });
                    },

                    _createShowAllButton: function ()
                    {
                        var input = this.input,
					    wasOpen = false;

                        $("<a>")
					    .attr("tabIndex", -1)
					    .attr("title", "Show All Items")
					    .tooltip()
					    .appendTo(this.wrapper)
					    .button({
					        icons: {
					            primary: "ui-icon-triangle-1-s"
					        },
					        text: false
					    })
					    .removeClass("ui-corner-all")
					    .addClass("custom-combobox-toggle ui-corner-right")
					    .mousedown(function ()
					    {
					        wasOpen = input.autocomplete("widget").is(":visible");
					    })
					    .click(function ()
					    {
					        input.focus();

					        // Close if already visible
					        if (wasOpen)
					        {
					            return;
					        }

					        // Pass empty string as value to search for, displaying all results
					        input.autocomplete("search", "");
					    });
                    },

                    _source: function (request, response)
                    {
                        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                        response(this.element.children("option").map(function ()
                        {
                            var text = $(this).text();
                            var origValue = $(this).val();
                            if (this.value && (!request.term || matcher.test(text)))
                                return {
                                    label: text.replace(
        											    new RegExp(
        												    "(?![^&;]+;)(?!<[^<>]*)(" +
        												    $.ui.autocomplete.escapeRegex(request.term) +
        												    ")(?![^<>]*>)(?![^&;]+;)", "gi"
        											    ), "<strong>$1</strong>"),
                                    value: text,
                                    oValue: origValue,
                                    option: this
                                };
                        }));
                    },

                    _removeIfInvalid: function (event, ui)
                    {

                        // Selected an item, nothing to do
                        if (ui.item)
                        {
                            return;
                        }

                        // Search for a match (case-insensitive)
                        var value = this.input.val(),
					    valueLowerCase = value.toLowerCase(),
					    valid = false;
                        this.element.children("option").each(function ()
                        {
                            if ($(this).text().toLowerCase() === valueLowerCase)
                            {
                                this.selected = valid = true;
                                return false;
                            }
                        });

                        // Found a match, nothing to do
                        if (valid)
                        {
                            return;
                        }

                        // Remove invalid value
                        this.input
					    .val("")
					    .attr("title", value + " didn't match any item")
					    .tooltip("open");
                        this.element.val("");
                        this._delay(function ()
                        {
                            this.input.tooltip("close").attr("title", "");
                        }, 2500);
                        this.input.autocomplete("instance").term = "";
                    },

                    _destroy: function ()
                    {
                        this.wrapper.remove();
                        this.element.show();
                    }
                });
            })(jQuery);

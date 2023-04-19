local classes = {}

local class_definitions = class(classes)
local import = class_definitions.import
local extends = class_definitions.extends
local static = class_definitions.static
local public = class_definitions.public
local private = class_definitions.private
local operators = class_definitions.operators
local class = class_definitions.class
local interface_definitions = interface(classes)
local interface = interface_definitions.interface
local abstract_function = interface_definitions.abstract_function
local implements = interface_definitions.implements
local util = util(classes)
local is = util.is
local show_warnings = util.show_warnings
local allow_writing_to_objects = util.allow_writing_to_objects

function namespacer ( )
  return {
    show_warnings = show_warnings,
    allow_writing_to_objects = allow_writing_to_objects,
    static = static,
    private = private,
    public = public,
    operators = operators,
    extends = extends,
    class = class,
    interface = interface,
    abstract_function = abstract_function,
    implements = implements,
    is = is,
    import = import
  }
end

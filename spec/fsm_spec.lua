require("busted")

local machine = require("statemachine")
local _ = require("luassert.match")._

describe("Lua state machine framework", function()
  describe("A stop light", function()
    local fsm
    local stoplight = {
      { name = 'warn',  from = 'green',  to = 'yellow' },
      { name = 'panic', from = 'yellow', to = 'red'    },
      { name = 'calm',  from = 'red',    to = 'yellow' },
      { name = 'clear', from = 'yellow', to = 'green'  }
    }

    before_each(function()
      fsm = machine.create({ initial = 'green', events = stoplight })
    end)

    it("should star
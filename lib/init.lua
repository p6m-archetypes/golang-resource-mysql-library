-- golang-resource-mysql-library main module.
-- Renders MySQL connection setup and baseline migrations.
--
-- The calling archetype is responsible for adding the corresponding
-- Go module dependency:
--   github.com/go-sql-driver/mysql
--
-- API (called from a parent archetype):
--   local mysql = require("golang-resource-mysql")
--   mysql.render(context, { destination = context:get("project-name") })
--
-- Context contract (no required keys beyond what the calling archetype provides).

local M = {}

function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M

(module
 (type $0 (func (result f64)))
 (type $1 (func (param i32 i32)))
 (type $2 (func))
 (type $3 (func (param i32 i32 f64)))
 (import "env" "memory" (memory $0 0))
 (import "game-of-life" "BGR_DEAD" (global $assembly/game-of-life/BGR_DEAD i32))
 (import "game-of-life" "BGR_ALIVE" (global $assembly/game-of-life/BGR_ALIVE i32))
 (import "game-of-life" "BIT_ROT" (global $assembly/game-of-life/BIT_ROT i32))
 (import "env" "Math.random" (func $~lib/bindings/dom/Math.random (result f64)))
 (global $assembly/game-of-life/width (mut i32) (i32.const 0))
 (global $assembly/game-of-life/height (mut i32) (i32.const 0))
 (global $assembly/game-of-life/offset (mut i32) (i32.const 0))
 (export "init" (func $assembly/game-of-life/init))
 (export "step" (func $assembly/game-of-life/step))
 (export "fill" (func $assembly/game-of-life/fill))
 (export "memory" (memory $0))
 (func $assembly/game-of-life/init (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  global.set $assembly/game-of-life/width
  local.get $1
  global.set $assembly/game-of-life/height
  local.get $0
  local.get $1
  i32.mul
  global.set $assembly/game-of-life/offset
  loop $for-loop|0
   local.get $1
   local.get $3
   i32.gt_s
   if
    i32.const 0
    local.set $2
    loop $for-loop|1
     local.get $0
     local.get $2
     i32.gt_s
     if
      global.get $assembly/game-of-life/BGR_DEAD
      i32.const 16777215
      i32.and
      global.get $assembly/game-of-life/BGR_ALIVE
      i32.const -16777216
      i32.or
      call $~lib/bindings/dom/Math.random
      f64.const 0.1
      f64.gt
      select
      local.set $4
      global.get $assembly/game-of-life/offset
      local.get $3
      global.get $assembly/game-of-life/width
      i32.mul
      i32.add
      local.get $2
      i32.add
      i32.const 2
      i32.shl
      local.get $4
      i32.store
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|1
     end
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
 )
 (func $assembly/game-of-life/step
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  global.get $assembly/game-of-life/height
  local.tee $4
  i32.const 1
  i32.sub
  local.set $2
  global.get $assembly/game-of-life/width
  local.tee $5
  i32.const 1
  i32.sub
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $4
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.sub
    local.get $2
    local.get $1
    select
    local.set $6
    local.get $1
    i32.const 1
    i32.add
    i32.const 0
    local.get $1
    local.get $2
    i32.ne
    select
    local.set $7
    i32.const 0
    local.set $0
    loop $for-loop|1
     local.get $0
     local.get $5
     i32.lt_s
     if
      local.get $0
      i32.const 1
      i32.sub
      local.get $3
      local.get $0
      select
      local.tee $9
      local.get $6
      global.get $assembly/game-of-life/width
      i32.mul
      local.tee $8
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      local.get $0
      local.get $8
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $8
      local.get $0
      i32.const 1
      i32.add
      i32.const 0
      local.get $0
      local.get $3
      i32.ne
      select
      local.tee $10
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $1
      global.get $assembly/game-of-life/width
      i32.mul
      local.tee $8
      local.get $9
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $8
      local.get $10
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $9
      local.get $7
      global.get $assembly/game-of-life/width
      i32.mul
      local.tee $9
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $0
      local.get $9
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.get $9
      local.get $10
      i32.add
      i32.const 2
      i32.shl
      i32.load
      i32.const 1
      i32.and
      i32.add
      local.set $9
      local.get $0
      local.get $8
      i32.add
      i32.const 2
      i32.shl
      i32.load
      local.tee $10
      i32.const 1
      i32.and
      if
       local.get $9
       i32.const 14
       i32.and
       i32.const 2
       i32.eq
       if
        local.get $8
        global.get $assembly/game-of-life/offset
        i32.add
        local.get $0
        i32.add
        i32.const 2
        i32.shl
        local.get $10
        i32.const 16777215
        i32.and
        local.get $10
        i32.const 24
        i32.shr_u
        global.get $assembly/game-of-life/BIT_ROT
        i32.sub
        local.tee $8
        i32.const 0
        local.get $8
        i32.const 0
        i32.gt_s
        select
        i32.const 24
        i32.shl
        i32.or
        i32.store
       else
        global.get $assembly/game-of-life/offset
        local.get $1
        global.get $assembly/game-of-life/width
        i32.mul
        i32.add
        local.get $0
        i32.add
        i32.const 2
        i32.shl
        global.get $assembly/game-of-life/BGR_DEAD
        i32.const -16777216
        i32.or
        i32.store
       end
      else
       local.get $9
       i32.const 3
       i32.eq
       if
        global.get $assembly/game-of-life/offset
        local.get $1
        global.get $assembly/game-of-life/width
        i32.mul
        i32.add
        local.get $0
        i32.add
        i32.const 2
        i32.shl
        global.get $assembly/game-of-life/BGR_ALIVE
        i32.const -16777216
        i32.or
        i32.store
       else
        global.get $assembly/game-of-life/offset
        local.get $1
        global.get $assembly/game-of-life/width
        i32.mul
        i32.add
        local.get $0
        i32.add
        i32.const 2
        i32.shl
        local.get $10
        i32.const 16777215
        i32.and
        local.get $10
        i32.const 24
        i32.shr_u
        global.get $assembly/game-of-life/BIT_ROT
        i32.sub
        local.tee $8
        i32.const 0
        local.get $8
        i32.const 0
        i32.gt_s
        select
        i32.const 24
        i32.shl
        i32.or
        i32.store
       end
      end
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      br $for-loop|1
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/game-of-life/fill (param $0 i32) (param $1 i32) (param $2 f64)
  (local $3 i32)
  (local $4 i32)
  loop $for-loop|0
   local.get $3
   global.get $assembly/game-of-life/width
   i32.lt_s
   if
    call $~lib/bindings/dom/Math.random
    local.get $2
    f64.lt
    if
     global.get $assembly/game-of-life/offset
     local.get $1
     global.get $assembly/game-of-life/width
     i32.mul
     i32.add
     local.get $3
     i32.add
     i32.const 2
     i32.shl
     global.get $assembly/game-of-life/BGR_ALIVE
     i32.const -16777216
     i32.or
     i32.store
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  loop $for-loop|1
   local.get $4
   global.get $assembly/game-of-life/height
   i32.lt_s
   if
    call $~lib/bindings/dom/Math.random
    local.get $2
    f64.lt
    if
     global.get $assembly/game-of-life/offset
     local.get $4
     global.get $assembly/game-of-life/width
     i32.mul
     i32.add
     local.get $0
     i32.add
     i32.const 2
     i32.shl
     global.get $assembly/game-of-life/BGR_ALIVE
     i32.const -16777216
     i32.or
     i32.store
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|1
   end
  end
 )
)

{loaddata name="referral_tree" var=tree}

{literal}
<style>

/* It's supposed to look like a tree diagram */
.tree, .tree ul, .tree li {
    list-style: none;
    margin: 0;
    padding: 0;
    position: relative;
}

.tree {
    margin: 0 0 1em;
    text-align: center;
}
.tree, .tree ul {
    display: table;
}
.tree ul {
  width: 100%;
}
    .tree li {
        display: table-cell;
        padding: .5em 0;
        vertical-align: top;
    }
        /* _________ */
        .tree li:before {
            outline: solid 1px #666;
            content: "";
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
        }
        .tree li:first-child:before {left: 50%;}
        .tree li:last-child:before {right: 50%;}

        .tree code, .tree span {
            border: solid .1em #666;
            border-radius: .2em;
            display: inline-block;
            margin: 0 .2em .5em;
            padding: .2em .5em;
            position: relative;
        }
        /* If the tree represents DOM structure */
        .tree code {
            font-family: monaco, Consolas, 'Lucida Console', monospace;
        }

            /* | */
            .tree ul:before,
            .tree code:before,
            .tree span:before {
                outline: solid 1px #666;
                content: "";
                height: .5em;
                left: 50%;
                position: absolute;
            }
            .tree ul:before {
                top: -.5em;
            }
            .tree code:before,
            .tree span:before {
                top: -.55em;
            }

/* The root node doesn't connect upwards */
.tree > li {margin-top: 0;}
    .tree > li:before,
    .tree > li:after,
    .tree > li > code:before,
    .tree > li > span:before {
      outline: none;
    }
.tree code>.datails {
  display: none;
  position: absolute;
  top: 90%;
  left: 55%;
  border: solid 2px #000;
  border-radius: 5px;
  padding: 5px;
  background-color: #ccc;
  text-align: left;
  z-index: 100;
}
.tree code:hover>.datails {
  display: block;
}
</style>
{/literal}

{function name="leaf"}
<li><code>{$user.data.username|escape:html}{if $user.data.email}<div class="datails"><nobr>Email: {$user.data.email|escape:html}</nobr><br>Phone: {$user.details.cell_phone|escape:html|default:"n/a"}<br>Country: {$user.details.country|escape:html|default:"n/a"}</div>{/if}</code>
{if $user.refs}
<ul>
{foreach from=$user.refs item=u}
  {call name="leaf" user=$u}
{/foreach}
</ul>
{/if}
</li>
{/function}


<ul class="tree">
{call name="leaf" user=$tree[$userinfo.id]}
</ul>

<hr>

 <ul class="tree">
    <li><code>User A</code>
      <ul>
        <li><code>User B</code>
          <ul>
            <li><code>User D</code>
              <ul>
                <li><code>User F</code>
                  <ul>
                    <li><code>User I</code></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li><code>User C</code>
          <ul>
            <li><code>User E</code>
              <ul>
                <li><code>User J</code>
                  <ul>
                    <li><code>User H</code></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
import json
import mistletoe
from mistletoe.ast_renderer import ASTRenderer

md_txt = """
# My Heading 
This is **bold** text
"""

ast = mistletoe.Document(md_txt)

print(f"root:{type(ast)}")
print(f"1st child:{type(ast.children[0])}")

def print_tree(node, depth=0):
    indent = " " * depth
    node_name = node.__class__.__name__
    if hasattr(node, 'children') and node.children:
        for child in node.children:
            print_tree(child, depth+1)
    elif hasattr(node, 'content'):
        print(f"{indent}  val: {repr(node.content)}")

with ASTRenderer() as renderer:
    ast_json = renderer.render(ast)

ast_dict = json.loads(ast_json)

print(json.dumps(ast_dict, indent = 2))
package edu.sjsu.fwjs;
/**
 * Nada 152 Proj part 3
 */

import edu.sjsu.fwjs.parser.FeatherweightJavaScriptBaseVisitor;
import edu.sjsu.fwjs.parser.FeatherweightJavaScriptParser;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class ExpressionBuilderVisitor extends FeatherweightJavaScriptBaseVisitor<Expression> {
    @Override
    public Expression visitProg(FeatherweightJavaScriptParser.ProgContext ctx) {
        List<Expression> stmts = new ArrayList<Expression>();
        for (int i = 0; i < ctx.stat().size(); i++) {
            Expression exp = visit(ctx.stat(i));
            if (exp != null)
                stmts.add(exp);
        }
        return listToSeqExp(stmts);
    }

    @Override
    public Expression visitBareExpr(FeatherweightJavaScriptParser.BareExprContext ctx) {
        return visit(ctx.expr());
    }

    @Override
    public Expression visitIfThenElse(FeatherweightJavaScriptParser.IfThenElseContext ctx) {
        Expression cond = visit(ctx.expr());
        Expression thn = visit(ctx.block(0));
        Expression els = visit(ctx.block(1));
        return new IfExpr(cond, thn, els);
    }

    @Override
    public Expression visitIfThen(FeatherweightJavaScriptParser.IfThenContext ctx) {
        Expression cond = visit(ctx.expr());
        Expression thn = visit(ctx.block());
        return new IfExpr(cond, thn, null);
    }
    @Override
    public Expression visitInt(FeatherweightJavaScriptParser.IntContext ctx) {
        int val = Integer.valueOf(ctx.INT().getText());
        return new ValueExpr(new IntVal(val));
    }

    @Override
    public Expression visitParens(FeatherweightJavaScriptParser.ParensContext ctx) {
        return visit(ctx.expr());
    }
    @Override
    public Expression visitFullBlock(FeatherweightJavaScriptParser.FullBlockContext ctx) {
        List<Expression> stmts = new ArrayList<Expression>();
        for (int i = 1; i < ctx.getChildCount() - 1; i++) {
            Expression exp = visit(ctx.getChild(i));
            stmts.add(exp);
        }
        return listToSeqExp(stmts);
    }
    /**
     * Converts a list of expressions to one sequence expression, if the list
     * contained more than one expression.
     */
    private Expression listToSeqExp(List<Expression> stmts) {
        if (stmts.isEmpty())
            return null;
        Expression exp = stmts.get(0);
        for (int i = 1; i < stmts.size(); i++) {
            exp = new SeqExpr(exp, stmts.get(i));
        }
        return exp;
    }
    @Override
    public Expression visitSimpleBlock(FeatherweightJavaScriptParser.SimpleBlockContext ctx) {
        return visit(ctx.stat());
    }


    //start adding here
    @Override
    public Expression visitVarRef(FeatherweightJavaScriptParser.VarRefContext ctx) {
        return new VarExpr(ctx.IDENTIFIER().getSymbol().getText());
    }

    @Override
    public Expression visitVarDec(FeatherweightJavaScriptParser.VarDecContext ctx) {
        return new VarDeclExpr(ctx.IDENTIFIER().getSymbol().getText(), visit(ctx.expr()));
    }
    @Override
    public Expression visitAssignment(FeatherweightJavaScriptParser.AssignmentContext ctx) {
        return new AssignExpr(ctx.IDENTIFIER().getSymbol().getText(), visit(ctx.expr()));
    }
    @Override
    public Expression visitAnonFuncDec(FeatherweightJavaScriptParser.AnonFuncDecContext ctx) {
        List<TerminalNode> tnodes;
        if (ctx.idlist() != null)
            tnodes = ctx.idlist().IDENTIFIER();
        else
            tnodes = Collections.emptyList();
        List<String> params = new ArrayList<String>();
        for(TerminalNode tn : tnodes){
            params.add(tn.getSymbol().getText());
        }
        Expression body = visit(ctx.block());
        return new FunctionAppExpr.AnonFunctionDeclExpr(params,body);
    }
    @Override
    public Expression visitWhile(FeatherweightJavaScriptParser.WhileContext ctx) {
        Expression cond = visit(ctx.expr());
        Expression keepDoing = visit(ctx.block());
        return new WhileExpr(cond, keepDoing);
    }

    @Override
    public Expression visitPrint(FeatherweightJavaScriptParser.PrintContext ctx) {
        Expression val = visit(ctx.expr());
        return new PrintExpr(val);
    }
    @Override
    public Expression visitBoolean(FeatherweightJavaScriptParser.BooleanContext ctx) {
        Boolean bol = Boolean.valueOf(ctx.BOOL().getText());
        return new ValueExpr(new BoolVal(bol));
    }
    @Override
    public Expression visitNull(FeatherweightJavaScriptParser.NullContext ctx) {
        return new ValueExpr(new NullVal());
    }

    @Override
    public Expression visitFuncApp(FeatherweightJavaScriptParser.FuncAppContext ctx) {
        List<Expression> args = Collections.emptyList();
        if (ctx.arglist() != null)
            args = ctx.arglist().expr()
                    .stream().map(x -> visit(x)).collect(Collectors.toList());
        return new FunctionAppExpr(visit(ctx.expr()), args);
    }

    public Expression visitArglist(FeatherweightJavaScriptParser.ArglistContext ctx) {
        throw new RuntimeException("Should not be called (arguments)");
    }
    @Override
    public Expression visitFuncDec(FeatherweightJavaScriptParser.FuncDecContext ctx) {
        String name = ctx.IDENTIFIER().getSymbol().getText();
        List<TerminalNode> tnodes;
        if (ctx.idlist() != null)
            tnodes = ctx.idlist().IDENTIFIER();
        else
            tnodes = Collections.emptyList();
        List<String> params = new ArrayList<String>();
        for(TerminalNode tn : tnodes){
            params.add(tn.getSymbol().getText());
        }
        Expression body = visit(ctx.block());
        return new FunctionDeclExpr(params,body);
    }
    @Override
    public Expression visitMulDivMod(FeatherweightJavaScriptParser.MulDivModContext ctx) {
        Expression x = visit(ctx.expr(0));
        Expression y = visit(ctx.expr(1));
        int op = ctx.op.getType();
        if (op == FeatherweightJavaScriptParser.MUL)
            return new BinOpExpr(Op.MULTIPLY,x, y);
        else if (op == FeatherweightJavaScriptParser.MOD)
            return new BinOpExpr(Op.MOD,x, y);
        else
            return new BinOpExpr(Op.DIVIDE,x, y);
    }
    @Override
    public Expression visitCompare(FeatherweightJavaScriptParser.CompareContext ctx) {
        Expression x = visit(ctx.expr(0));
        Expression y = visit(ctx.expr(1));
        int op = ctx.op.getType();
        if (op == FeatherweightJavaScriptParser.GT)
            return new BinOpExpr(Op.GT,x, y);
        else if (op == FeatherweightJavaScriptParser.GE)
            return new BinOpExpr(Op.GE,x, y);
        else if (op == FeatherweightJavaScriptParser.LT)
            return new BinOpExpr(Op.LT,x, y);
        else if (op == FeatherweightJavaScriptParser.LE)
            return new BinOpExpr(Op.LE,x, y);
        else
            return new BinOpExpr(Op.EQ,x, y);
    }
    @Override
    public Expression visitAddSub(FeatherweightJavaScriptParser.AddSubContext ctx) {
        Expression x = visit(ctx.expr(0));
        Expression y = visit(ctx.expr(1));
        int op = ctx.op.getType();
        if (op == FeatherweightJavaScriptParser.PLUS)
            return new BinOpExpr(Op.ADD,x, y);
        else
            return new BinOpExpr(Op.SUBTRACT,x, y);
    }


}

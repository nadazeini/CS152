package edu.sjsu.fwjs;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
/**
 * Nada Cs152 new
 */

/**
 * FWJS expressions.
 */
public interface Expression {
    /**
     * Evaluate the expression in the context of the specified environment.
     */
    public Value evaluate(Environment env);
}

// NOTE: Using package access so that all implementations of Expression
// can be included in the same file.

/**
 * FWJS constants.
 */
class ValueExpr implements Expression {
    private Value val;
    public ValueExpr(Value v) {
        this.val = v;
    }
    public Value evaluate(Environment env) {
        return this.val;
    }
}

/**
 * Expressions that are a FWJS variable.
 */
class VarExpr implements Expression {
    private String varName;
    public VarExpr(String varName) {
        this.varName = varName;
    }
    public Value evaluate(Environment env) {
        return env.resolveVar(varName);
    }
}

/**
 * A print expression.
 */
class PrintExpr implements Expression {
    private Expression exp;
    public PrintExpr(Expression exp) {
        this.exp = exp;
    }
    public Value evaluate(Environment env) {
        Value v = exp.evaluate(env);
        System.out.println(v.toString());
        return v;
    }
}
/**
 * Binary operators (+, -, *, etc).
 * Currently only numbers are supported.
 */
class BinOpExpr implements Expression {
    private Op op;
    private List<Expression> exprs;

    public BinOpExpr(Op op, Expression e1, Expression e2) {
        this.op = op;
        this.exprs = new ArrayList();
        this.exprs.add(e1);
        this.exprs.add(e2);
    }


    @SuppressWarnings("incomplete-switch")

    public Value evaluate(Environment env) {
        List<Value> vs = this.exprs.stream().map(x -> x.evaluate(env)).collect(Collectors.toList());
        Boolean nullFlag = vs.stream().anyMatch(x -> (x == null));
        Boolean closureFlag = vs.stream().anyMatch(x -> (x instanceof ClosureVal));

        List<Integer> vals = vs.stream().map(
                x -> {
                    if (x instanceof BoolVal)
                        return ((BoolVal) x).toBoolean() ? 1 : 0;
                    else if (x instanceof NullVal)
                        return 0;
                    else if (x instanceof ClosureVal)
                        return -1;
                    return ((IntVal) x).toInt();
                }
        ).collect(Collectors.toList());
        int x = vals.get(0);
        int y = vals.get(1);

        if (nullFlag || closureFlag) {
            if (op.equals(Op.EQ)) {
                return new BoolVal(vs.get(0).equals(vs.get(1)));
            } else if (!nullFlag)
                throw new RuntimeException("Cannot compare with closure");
        }
        switch (op) {
            case ADD:
                return new IntVal(x + y);
            case DIVIDE:
                return new IntVal(x / y);
            case EQ:
                return new BoolVal(x == y);
            case GE:
                return new BoolVal(x >= y);
            case GT:
                return new BoolVal(x > y);
            case LE:
                return new BoolVal(x <= y);
            case LT:
                return new BoolVal(x < y);
            case MOD:
                return new IntVal(x % y);
            case MULTIPLY:
                return new IntVal(x * y);
            case SUBTRACT:
                return new IntVal(x - y);
            default:
                return new NullVal();

        }
    }
}


/**
 * If-then-else expressions.
 * Unlike JS, if expressions return a value.
 */
class IfExpr implements Expression {
    private Expression cond;
    private Expression thn;
    private Expression els;

    public IfExpr(Expression cond, Expression thn, Expression els) {
        this.cond = cond;
        this.thn = thn;
        this.els = els;
    }

    public Value evaluate(Environment env) {
        // YOUR CODE HERE
        if (((BoolVal) cond.evaluate(env)).toBoolean()) {
            return thn.evaluate(env);
        } else if (els != null) {
            return els.evaluate(env);
        }

        return new NullVal();
    }

}

/**
 * While statements (treated as expressions in FWJS, unlike JS).
 */
class WhileExpr implements Expression {
    private Expression cond;
    private Expression body;

    public WhileExpr(Expression cond, Expression body) {
        this.cond = cond;
        this.body = body;
    }

    public Value evaluate(Environment env) {
        // YOUR CODE HERE
        Value whileBody = new NullVal();

        while (((BoolVal) cond.evaluate(env)).toBoolean()) {
            whileBody = body.evaluate(env);
        }
        return whileBody;

    }
}

/**
 * Sequence expressions (i.e. 2 back-to-back expressions).
 */
class SeqExpr implements Expression {
    private Expression e1;
    private Expression e2;

    public SeqExpr(Expression e1, Expression e2) {
        this.e1 = e1;
        this.e2 = e2;
    }

    public Value evaluate(Environment env) {
        // YOUR CODE HERE
        e1.evaluate(env);
        return e2.evaluate(env);
    }
}

/**
 * Declaring a variable in the local scope.
 */
class VarDeclExpr implements Expression {
    private String varName;
    private Expression exp;

    public VarDeclExpr(String varName, Expression exp) {
        this.varName = varName;
        this.exp = exp;
    }

    public Value evaluate(Environment env) {
        // YOUR CODE HERE
        env.createVar(varName, exp.evaluate(env));
        return env.resolveVar(varName);

    }
}

/**
 * Updating an existing variable.
 * If the variable is not set already, it is added
 * to the global scope.
 */
class AssignExpr implements Expression {
    private String varName;
    private Expression e;

    public AssignExpr(String varName, Expression e) {
        this.varName = varName;
        this.e = e;
    }

    public Value evaluate(Environment env) { //if the variable is not found will  go to global
        //returns after update
        env.updateVar(varName, e.evaluate(env));
        return env.resolveVar(varName);
    }
}

/**
 * A function declaration, which evaluates to a closure.
 */
class FunctionDeclExpr implements Expression {
    private List<String> params;
    private Expression body;

    public FunctionDeclExpr(List<String> params, Expression body) {
        this.params = params;
        this.body = body;
    }

    public Value evaluate(Environment env) {

        return new ClosureVal(params, body, env);

    }
}

/**
 * Function application.
 */
class FunctionAppExpr implements Expression {
    private Expression f;
    private List<Expression> args;

    public FunctionAppExpr(Expression f, List<Expression> args) {
        this.f = f;
        this.args = args;
    }

    public Value evaluate(Environment env) {
        // YOUR CODE HERE
        ClosureVal val = (ClosureVal) f.evaluate(env);    // Evaluate f expression to get ClosureVal
        List<Value> evalArgs = new ArrayList<Value>();    // List to hold evaluated values.

        // Add evaluated Expressions from args to evalArgs to be used in the function.
        for (int i = 0; i < args.size(); i++) {
            evalArgs.add(args.get(i).evaluate(env));
        }
        // Apply the evaluated Expressions to the val function.
        return val.apply(evalArgs);
    }


    /**
     * A function declaration, which evaluates to a closure.
     */
    static class AnonFunctionDeclExpr implements Expression {
        private List<String> params;
        private Expression body;

        public AnonFunctionDeclExpr(List<String> params, Expression body) {
            this.params = params;
            this.body = body;
        }

        public Value evaluate(Environment env) {
            return new ClosureVal(params, body, env);
        }
    }
}



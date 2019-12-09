package edu.sjsu.fwjs;

import java.util.Map;

import java.util.HashMap;

public class Environment {
    public Map<String, Value> env = new HashMap<String, Value>();
    private Environment outerEnv;

    /**
     * Constructor for global environment
     */
    public Environment() {
    }

    /**
     * Constructor for local environment of a function
     */
    public Environment(Environment outerEnv) {
        this.outerEnv = outerEnv;
    }

    /**
     * Handles the logic of resolving a variable.
     * If the variable name is in the current scope, it is returned.
     * Otherwise, search for the variable in the outer scope.
     * If we are at the outermost scope (AKA the global scope)
     * null is returned (similar to how JS returns undefined.
     */
    public Value resolveVar(String varName) {
        if (env.containsKey(varName)) {
            return env.get(varName);
        } else if (outerEnv != null) {
            return outerEnv.resolveVar(varName);
        } else
            throw new RuntimeException("Variable undefined");
    }

    /**
     * Used for updating existing variables.
     * If a variable has not been defined previously in the current scope,
     * or any of the function's outer scopes, the var is stored in the global scope.
     */
    public void updateVar(String varName, Value v) {
        if (env.containsKey(varName)) {
            env.put(varName, v);
        } else if (outerEnv != null) {
            outerEnv.updateVar(varName, v);
        } else
            env.put(varName, v);
    }
    /**
     * Sets a variable with a given key in the env HashMap.
     * @param key variable reference.
     * @param v variable value.
     */
    public void setVar(String key, Value v) {
        env.put(key, v);
    }
    /**
     * Gets the Environment outside of this Environment.
     * @return the outer Environment or null if there is none.
     */
    public Environment getOuterEnv() {
        return outerEnv;
    }

    /**
     * Creates a new variable in the local scope.
     * If the variable has been defined in the current scope previously,
     * a RuntimeException is thrown.
     */
    public void createVar(String varName, Value v) throws RuntimeException {
        if (!env.containsKey(varName)) {
            env.put(varName, v);
        } else {
            throw new RuntimeException("Variable exists");
        }
    }
}

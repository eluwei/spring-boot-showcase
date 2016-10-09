package org.lina.boot.api.web.controller;

import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

/**
 * Created with IntelliJ IDEA.
 * User: Foy Lian
 * Date: 2016-09-14
 * Time: 12:42
 */
public class TestProgress extends TestWatcher {

    @Override
    protected void starting(Description description) {
        System.out.println("\n[Test Case starting] " + description.getTestClass().getSimpleName() + "."
                + description.getMethodName() + "()\n");
    }

    @Override
    protected void finished(Description description) {
        System.out.println("\n[Test Case finished] " + description.getTestClass().getSimpleName() + "."
                + description.getMethodName() + "()\n");
    }

}

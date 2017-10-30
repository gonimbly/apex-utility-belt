/**
 * AUB_FluentIterable
 * https://blog.alainodea.com/en/article/465/improved-apex-fluentiterable
 */
public class AUB_FluentIterable {
    private final List<Object> sourceList;
    private final List<Operation> operations;

    private abstract class Operation {
        public abstract void run(List<Object> listToPopulate, Object o, Iterator<Operation> operationIterator);
    }

    public interface Function {
        Object apply(Object o);
    }

    public interface Predicate {
        Boolean apply(Object o);
    }

    private class Transform extends Operation {
        private final Function transform;
        public Transform(Function transform) {
            this.transform = transform;
        }
        public override void run(List<Object> listToPopulate, Object o, Iterator<Operation> operationIterator) {
            Object transformed = transform.apply(o);
            if (operationIterator.hasNext()) {
                operationIterator.next().run(listToPopulate, transformed, operationIterator);
            } else {
                listToPopulate.add(transformed);
            }
        }
    }

    private class Filter extends Operation {
        private final Predicate filter;
        public Filter(Predicate filter) {
            this.filter = filter;
        }
        public override void run(List<Object> listToPopulate, Object o, Iterator<Operation> operationIterator) {
            if (filter.apply(o)){
                if (operationIterator.hasNext()) {
                    operationIterator.next().run(listToPopulate, o, operationIterator);
                } else {
                    listToPopulate.add(o);
                }
            }
        }
    }

    public static AUB_FluentIterable fromList(List<Object> sourceList) {
        return new AUB_FluentIterable(sourceList);
    }

    private AUB_FluentIterable(List<Object> sourceList) {
        this.sourceList = sourceList;
        this.operations = new List<Operation>();
    }

    public List<Object> intoList(List<Object> listToPopulate) {
        for (Object o : sourceList) {
            runOperations(listToPopulate, o, operations.iterator());
        }
        return listToPopulate;
    }

    private void runOperations(List<Object> listToPopulate, Object o, Iterator<Operation> operationIterator) {
        if (operationIterator.hasNext()) {
            operationIterator.next().run(listToPopulate, o, operationIterator);
        } else {
            listToPopulate.add(o);
        }
    }

    public AUB_FluentIterable filter(Predicate p) {
        operations.add(new Filter(p));
        return this;
    }

    public AUB_FluentIterable transform(Function f) {
        operations.add(new Transform(f));
        return this;
    }
}

using Gee;
using GLib.Test;

using Diva;

namespace Diva.Tests
{
    public class CollectionTests : TestFixture
    {
        public CollectionTests()
        {
            base("CollectionTests");

            add_test("ResolveDirectly", ResolveDirectly);
            add_test("ResolveAsComponent", ResolveAsComponent);
            add_test("CanBeEmpty", CanBeEmpty);
        }

        private void ResolveDirectly()
        {
            var builder = new ContainerBuilder();
            builder.register<ServiceA>().as<InterfaceA>();
            builder.register<ServiceB>().as<InterfaceA>();
            var container = builder.build();

            try
            {
                var resolved = container.resolve_collection<InterfaceA>();
                if(resolved.size != 2)
                {
                    stderr.printf(@"Expected to get 2 items, actually $(resolved.size).\n");
                    fail();
                }

                var a = resolved.to_array()[0];
                if(a == null)
                {
                    stderr.printf("Unable to create for A\n");
                    fail();
                }

                var b = resolved.to_array()[1];
                if(b == null)
                {
                    stderr.printf("Unable to create for B\n");
                    fail();
                }
            } catch (ResolveError e) {Test.message(@"ResolveError: $(e.message)"); fail(); }
        }

        private void ResolveAsComponent()
        {
            var builder = new ContainerBuilder();
            builder.register<ServiceA>().as<InterfaceA>();
            builder.register<ServiceB>().as<InterfaceA>();
            builder.register<RequiresCollection>();
            var container = builder.build();

            try {
                var resolved = container.resolve<RequiresCollection>();
                var a = resolved.Collection.to_array()[0];
                if(a == null)
                    fail();

                var b = resolved.Collection.to_array()[1];
                if(b == null)
                    fail();

            } catch (ResolveError e) {
                    stderr.printf("error 3: %s\n", e.message);Test.message(@"ResolveError: $(e.message)"); fail(); }
        }

        private void CanBeEmpty()
        {
            var builder = new ContainerBuilder();
            builder.register<RequiresCollection>();
            var container = builder.build();

            try {
                var resolved = container.resolve<RequiresCollection>();
                if(resolved.Collection.size != 0)
                {
                    fail();
                }

            } catch (ResolveError e) {
                    stderr.printf("error 3: %s\n", e.message);Test.message(@"ResolveError: $(e.message)"); fail(); }
        }

        private class ServiceA : Object, InterfaceA {}

        private class ServiceB : Object, InterfaceA {}

        private class RequiresCollection : Object
        {
            static construct
            {
                var cls = (ObjectClass)typeof(RequiresCollection).class_ref();
                set_collection_injection<InterfaceA>(cls, "Collection");
            }

            public Collection<InterfaceA> Collection {construct; get;}
        }
    }
}




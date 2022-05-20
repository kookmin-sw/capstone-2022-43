import passport from 'passport';
import { ownerStrategy, forwarderStrategy } from './localStrategy';


passport.use('owner', ownerStrategy);
passport.use('forwarder', forwarderStrategy);

passport.initialize();